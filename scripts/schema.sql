-- Catalogo Triangulo Distribuidora
-- Banco compartilhado com a ACIA: tudo prefixado com catalogo_ para nao colidir.
-- Rodar uma vez, no SQL Editor do Supabase ou via psql.

-- ---------------------------------------------------------------- admins
-- Quem pode escrever. O usuario e criado no Supabase Auth; o uid entra aqui.
create table if not exists public.catalogo_admins (
  user_id uuid primary key references auth.users(id) on delete cascade,
  email   text,
  criado_em timestamptz not null default now()
);

create or replace function public.catalogo_e_admin()
returns boolean
language sql stable security definer set search_path = public
as $$
  select exists (select 1 from public.catalogo_admins where user_id = auth.uid());
$$;

-- ---------------------------------------------------------------- marcas
create table if not exists public.catalogo_marcas (
  id        uuid primary key default gen_random_uuid(),
  slug      text unique not null,
  nome      text not null,
  descricao text,
  logo_url  text,
  ordem     integer not null default 0,
  ativo     boolean not null default true,
  criado_em     timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

-- ------------------------------------------------------------- produtos
create table if not exists public.catalogo_produtos (
  id        uuid primary key default gen_random_uuid(),
  marca_id  uuid not null references public.catalogo_marcas(id) on delete cascade,
  nome      text not null,
  descricao text,
  imagem_url text,
  ordem     integer not null default 0,
  ativo     boolean not null default true,
  criado_em     timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

create index if not exists catalogo_produtos_marca_idx on public.catalogo_produtos (marca_id, ordem);
create index if not exists catalogo_marcas_ordem_idx  on public.catalogo_marcas (ordem);

-- ------------------------------------------------------ atualizado_em
create or replace function public.catalogo_toca_atualizado_em()
returns trigger language plpgsql as $$
begin
  new.atualizado_em = now();
  return new;
end;
$$;

drop trigger if exists catalogo_marcas_touch on public.catalogo_marcas;
create trigger catalogo_marcas_touch before update on public.catalogo_marcas
  for each row execute function public.catalogo_toca_atualizado_em();

drop trigger if exists catalogo_produtos_touch on public.catalogo_produtos;
create trigger catalogo_produtos_touch before update on public.catalogo_produtos
  for each row execute function public.catalogo_toca_atualizado_em();

-- -------------------------------------------------------------- RLS
-- Leitura: liberada (o site e publico e usa a chave anon no navegador).
-- Escrita: so quem esta em catalogo_admins.
alter table public.catalogo_marcas   enable row level security;
alter table public.catalogo_produtos enable row level security;
alter table public.catalogo_admins   enable row level security;

drop policy if exists catalogo_marcas_leitura on public.catalogo_marcas;
create policy catalogo_marcas_leitura on public.catalogo_marcas
  for select to anon, authenticated using (true);

drop policy if exists catalogo_marcas_escrita on public.catalogo_marcas;
create policy catalogo_marcas_escrita on public.catalogo_marcas
  for all to authenticated using (public.catalogo_e_admin()) with check (public.catalogo_e_admin());

drop policy if exists catalogo_produtos_leitura on public.catalogo_produtos;
create policy catalogo_produtos_leitura on public.catalogo_produtos
  for select to anon, authenticated using (true);

drop policy if exists catalogo_produtos_escrita on public.catalogo_produtos;
create policy catalogo_produtos_escrita on public.catalogo_produtos
  for all to authenticated using (public.catalogo_e_admin()) with check (public.catalogo_e_admin());

-- O admin ve a propria linha; ninguem se auto-cadastra pela API.
drop policy if exists catalogo_admins_leitura on public.catalogo_admins;
create policy catalogo_admins_leitura on public.catalogo_admins
  for select to authenticated using (user_id = auth.uid());

-- ------------------------------------------------------------ storage
-- Bucket publico para as imagens dos produtos e logos das marcas.
insert into storage.buckets (id, name, public)
values ('catalogo', 'catalogo', true)
on conflict (id) do update set public = true;

drop policy if exists catalogo_storage_leitura on storage.objects;
create policy catalogo_storage_leitura on storage.objects
  for select to anon, authenticated using (bucket_id = 'catalogo');

drop policy if exists catalogo_storage_escrita on storage.objects;
create policy catalogo_storage_escrita on storage.objects
  for all to authenticated
  using (bucket_id = 'catalogo' and public.catalogo_e_admin())
  with check (bucket_id = 'catalogo' and public.catalogo_e_admin());
