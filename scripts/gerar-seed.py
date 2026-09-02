#!/usr/bin/env python3
"""Gera scripts/seed.sql a partir de scripts/catalogo.json.

Idempotente: marcas entram por slug (on conflict do nothing) e os produtos de uma
marca so sao inseridos se ela ainda nao tiver nenhum -- assim rodar de novo nunca
apaga o que o cliente editou pelo painel.
"""
import json
import os

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def lit(v):
    if v is None:
        return 'null'
    return "'" + str(v).replace("'", "''") + "'"


dados = json.load(open(os.path.join(RAIZ, 'scripts', 'catalogo.json'), encoding='utf-8'))
linhas = ['-- Gerado por scripts/gerar-seed.py. Nao editar a mao.', 'begin;', '']

for m in dados['marcas']:
    linhas.append(
        'insert into public.catalogo_marcas (slug, nome, ordem) values '
        f'({lit(m["slug"])}, {lit(m["nome"])}, {m["ordem"]}) on conflict (slug) do nothing;')

linhas.append('')

for m in dados['marcas']:
    if not m['produtos']:
        continue
    valores = ',\n  '.join(
        f'({lit(p["nome"])}, {lit(p["imagem_url"])}, {p["ordem"]})' for p in m['produtos'])
    linhas.append(f"""-- {m['nome']} ({len(m['produtos'])} produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  {valores}
) as v(nome, imagem_url, ordem)
where mrc.slug = {lit(m['slug'])}
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);
""")

linhas.append('commit;')
destino = os.path.join(RAIZ, 'scripts', 'seed.sql')
open(destino, 'w', encoding='utf-8').write('\n'.join(linhas))
print(f'scripts/seed.sql: {len(dados["marcas"])} marcas, '
      f'{sum(len(m["produtos"]) for m in dados["marcas"])} produtos')
