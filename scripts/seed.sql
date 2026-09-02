-- Gerado por scripts/gerar-seed.py. Nao editar a mao.
begin;

insert into public.catalogo_marcas (slug, nome, ordem) values ('4-elementos', '4 Elementos', 1) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('alquimia-industria', 'Alquimia Industria', 2) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('apinil', 'Apinil', 3) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('atacado-ervas', 'Atacado Ervas', 4) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('bella-oil', 'Bella Oil', 5) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('bio-instinto', 'Bio Instinto', 6) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('bio-instinto-18-ervas', 'Bio Instinto / 18 Ervas', 7) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('bioceutica', 'Bioceutica', 8) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('bioklein', 'Bioklein', 9) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('celliv', 'Celliv', 10) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('demazon', 'Demazon', 11) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('emporio-das-ervas', 'Empório das Ervas', 12) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('essencial', 'Essencial', 13) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('essencial-bio', 'Essencial Bio', 14) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('faramel', 'Faramel', 15) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('fito-nature', 'Fito Nature', 16) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('flora-7-ervas', 'Flora 7 Ervas', 17) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('herbamix', 'Herbamix', 18) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('herbolab', 'Herbolab', 19) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('landerlabs', 'Landerlabs', 20) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('lysapharma', 'Lysapharma', 21) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('matugen', 'Matugen', 22) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('mc-sales', 'MC Sales', 23) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('melfort', 'Melfort', 24) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('multinature', 'Multinature', 25) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('natti-vida', 'Natti Vida', 26) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('natural-ervas', 'Natural Ervas', 27) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('nutribel', 'Nutribel', 28) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('perfeita-alquimia', 'Perfeita Alquimia', 29) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('san-jully', 'San Jully', 30) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('saude-e-vida', 'Saúde e Vida', 31) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('sem-mix-herbamix', 'Sem Mix / Herbamix', 32) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('soul', 'Soul', 33) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('vinagre-organico-sao-francisco', 'Vinagre Orgânico São Francisco', 34) on conflict (slug) do nothing;
insert into public.catalogo_marcas (slug, nome, ordem) values ('vitale-industria', 'Vitale Industria', 35) on conflict (slug) do nothing;

-- 4 Elementos (70 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Alcachofra 60 Cps', 'https://lh3.googleusercontent.com/d/1-a2f2wLlv1UFOWOvrxZam9Tn3Y49CzpT', 1),
  ('Amora 60 Cps', 'https://lh3.googleusercontent.com/d/1odV96JZnbfJDsquK2K2AfYL8-fTQ5_JS', 2),
  ('Amora com Isoflavona 60 Cps', 'https://lh3.googleusercontent.com/d/1JE7V3a0F-i5Xl77XrS9xKUXNvAIQ8zRY', 3),
  ('Amora Miura 60 Cps', 'https://lh3.googleusercontent.com/d/1TItKvJriszvIh8HgTrorirQ6hJOjvGLC', 4),
  ('Arnica do Mato', 'https://lh3.googleusercontent.com/d/1CbuUkOTFqCKCXlbAt0dZteIT2UszMc2C', 5),
  ('Berberina 60 Cps', null, 6),
  ('Berinjela Alcachofra', 'https://lh3.googleusercontent.com/d/1CqK1pfYoHArsQuJA0ZUAIrOdfj5zNvsQ', 7),
  ('Biotina B7 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1Q4Dl-VhOO97gfnDTpWDOi6iN7inc41q8', 8),
  ('Canela de Velho 500mg 120 Cps', 'https://lh3.googleusercontent.com/d/12D9usJBMOT-UtzIE-xP7imODa0ngMCJz', 9),
  ('Canela de Velho 120 Sucupira Garra e Unha de Gato', 'https://lh3.googleusercontent.com/d/178b8lcc2Skz5a65vyuLjeUpAiUA4IBRI', 10),
  ('Cardo Mariano 60 Cps', 'https://lh3.googleusercontent.com/d/17dOuJQ4ztewwB0PPP9UQtnQLKMoxvUJk', 11),
  ('Carvão Vegetal 300mg 60 Cps', 'https://lh3.googleusercontent.com/d/1-nRVk3FBn7po5ER6QpTUg1a62OWlEjHH', 12),
  ('Cáscara Sagrada 60 Cps', 'https://lh3.googleusercontent.com/d/1GQmH-Jp5J6LMENDID7T1X-s06NdRrLDo', 13),
  ('Castanha da Índia 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1-pYkPkAlOAMRckOUWUbs8upb1toXw1hU', 14),
  ('Cavalinha 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1kTgzvqPakt-zG9bMVR1ucAiUAXorV0Md', 15),
  ('Chá 37 Ervas 450mg 100 Cps', null, 16),
  ('Chá Verde 60 Cps', null, 17),
  ('Clorela 60 Cps', 'https://lh3.googleusercontent.com/d/14aJKWCyqR495s_HUdGBT6ed43A3fYepk', 18),
  ('Cloreto de Magnésio PA 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/13i63l80g70kWv5R4nWG9BvH0NP7u53vn', 19),
  ('Coenzima Q10 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/18YFIC4nSJbkrNoxZ5KGmE9ythGYeKViP', 20),
  ('Cúrcuma 500mg 100 Cps', 'https://lh3.googleusercontent.com/d/1LieiQUqTXGF2c6K_KuGNfH8ghkQuxx0N', 21),
  ('Cúrcuma com Pimenta Preta 120 Cps', 'https://lh3.googleusercontent.com/d/1-tklGfy5H8Z05NK5KyQgv2aQcgDM_-_N', 22),
  ('Cúrcuma com Ora Pro Nóbis e Gengibre 60 Cps', 'https://lh3.googleusercontent.com/d/18gePrnLbdgNUdUNxGcLnvsNt3tlTmIvE', 23),
  ('Erva Baleeira 60 Cps', 'https://lh3.googleusercontent.com/d/1a51a_GhVSALuOknvvDVfsbYIw2qBRKhz', 24),
  ('Espinheira Santa 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/100zmNlZ7jpRAf1pj63WE5lJGC3lr9yOq', 25),
  ('Extrato de Própolis 60 Cps', 'https://lh3.googleusercontent.com/d/1JulBl-uclYZPhEXPvqkmLRA-I40dLWmn', 26),
  ('Garcinia Cambogia 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1UziVLBcexoimXK_Xa1mTsLnjyf6S1IQe', 27),
  ('Garra d''Urso 60 Cps', 'https://lh3.googleusercontent.com/d/1TofGtjEwf0vhQVMzEDgSLw2bG4snRJrR', 28),
  ('Ginkgo Biloba 120mg 60 Cps', 'https://lh3.googleusercontent.com/d/14nqz2fTjL5jVrR3Gk55s9hMnImcA7h6B', 29),
  ('Ginkgo Biloba 80mg 60 Cps', 'https://lh3.googleusercontent.com/d/14nqz2fTjL5jVrR3Gk55s9hMnImcA7h6B', 30),
  ('Glico Stabil com Moringa 60 Cps', 'https://lh3.googleusercontent.com/d/1LUwxMaRKHIn1uCQcfZ7AV_ZTIBcuUJBb', 31),
  ('Golji Berry 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/108wItHNtEfHAypaNc5X7xbMXwEIcGuKh', 32),
  ('Graviola 60 Cps', 'https://lh3.googleusercontent.com/d/1j7K_Ki74TNJT4ZQnv6b4ncol3YugplCC', 33),
  ('Hibisco 60 Cps', 'https://lh3.googleusercontent.com/d/1fJBwSTR5NPqOBHr8DIw5DKNzqS-RuvkU', 34),
  ('Ioimbina 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1b7ALXaVRMS66zXBTiW7MNaqO7PPGXs_R', 35),
  ('Isoflavona 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/102fP7SUfQDBhtQKc0es2JXAyBTimrpa5', 36),
  ('K2 MK7', 'https://lh3.googleusercontent.com/d/1Ze2ezPiJM0kNw3ydR3RGYC4V0YILrV5U', 37),
  ('Laranja Moro 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/13GZmh3IKl-LOOI47sWCRN6VN0nujUMoX', 38),
  ('Luteína Zeaxantina 60 Cps', 'https://lh3.googleusercontent.com/d/15kd6K0dBgOV7e4TjJQYbduCkYHJxgX_O', 39),
  ('Maçã Black 60 Cps', 'https://lh3.googleusercontent.com/d/1-6WOj-gn9K0RMioJq1lSa2ho9RihtE19', 40),
  ('Maçã Peruana 600mg 120 Cps', 'https://lh3.googleusercontent.com/d/1SMwCmyxSYrZzCxpzCO9lvpPpJyRAWXfw', 41),
  ('Maçã Peruana 600mg 60 Cps', 'https://lh3.googleusercontent.com/d/1SMwCmyxSYrZzCxpzCO9lvpPpJyRAWXfw', 42),
  ('Magnésio Dimalato 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1ziCoHQ34AIVV1HyxHYSKGS8puWVvp77b', 43),
  ('Magnésio Quelato 60 Cps', 'https://lh3.googleusercontent.com/d/1YPpZVEohF_0tmPTeXBPYVWArGtMisYz-', 44),
  ('Magnésio Treonato 60 Cps', 'https://lh3.googleusercontent.com/d/1FQfKUGmdlQ-TsfMho5Lis60dD5-3ojvv', 45),
  ('Melão de São Caetano 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1Oz0PetriUUmuUNCchBCjIPYuI00gOcD2', 46),
  ('Moringa 60 Cps', 'https://lh3.googleusercontent.com/d/1Q2DUTaHlho05Uxj0wWRqSdBw9wIqnDoC', 47),
  ('Mulungu 60 Cps', null, 48),
  ('Óleo de Prímula 60 Cps', 'https://lh3.googleusercontent.com/d/1W4sfa4w8x2PHQ7WaAOKk9RSSmrSKIq8P', 49),
  ('Óleo de Semente de Abóbora 60 Cps', 'https://lh3.googleusercontent.com/d/1p7A3PeW_oOFUibrTb0Q8a3MUlBmyDDQs', 50),
  ('Ora Pro Nóbis 60 Cps', 'https://lh3.googleusercontent.com/d/1FVLLWx3wPYzXh9UftGlnKo9HpWirdajj', 51),
  ('Ora Pro Nóbis + Curcumina + Magnésio', null, 52),
  ('Passiflora 60 Cps', 'https://lh3.googleusercontent.com/d/1xYMjfmYtXhwzs3rQhDswEWCSHXA9EG6m', 53),
  ('Poli Vit A Z com Ômega 3 60 Cps', 'https://lh3.googleusercontent.com/d/1C6QFhThsuEDNTkWrGqCmIutquNjTWee_', 54),
  ('Psyllium 60 Cps', 'https://lh3.googleusercontent.com/d/1ItM1ywmoaLHYcQR6CsIwfldXPezbw9FS', 55),
  ('Quebra Pedra 60 Cps', 'https://lh3.googleusercontent.com/d/1uLEkNLQSjp63JAp1p6cNA0C-PihC3Gg-', 56),
  ('Seca Barriga 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1WLe8oTR3Zqg8RP6h49CKL9Xq8dF-erzt', 57),
  ('Seca Barriga 500mg 120 Cps', 'https://lh3.googleusercontent.com/d/1WLe8oTR3Zqg8RP6h49CKL9Xq8dF-erzt', 58),
  ('Selênio 60 Cps', 'https://lh3.googleusercontent.com/d/1-KlXiasfs2N0QBBZzMUKQ6m0kD48ZnBF', 59),
  ('Sene 60 Cps', 'https://lh3.googleusercontent.com/d/1V6rB9hTI4hyoigrWkjqspa2ju7KWw2V6', 60),
  ('Silício 60 Cps', null, 61),
  ('Spirulina 60 Cps', 'https://lh3.googleusercontent.com/d/1M3jsUVrg7ej_kyVs2N4wF0gzA9MZ_bmu', 62),
  ('Sucupira 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/104nH5UpL_5EbFl-3CHPeIxLVPvlOLh-W', 63),
  ('Sucupira Garra e Unha de Gato 60 Cps', 'https://lh3.googleusercontent.com/d/1TEWQ8o9zJJRDftaTX1eZ1weikaJA-6Xx', 64),
  ('Sucupira Magnésio 120 Cps', null, 65),
  ('Tribulus Terrestres 600mg 120 Cps', 'https://lh3.googleusercontent.com/d/10U4ktIcmn9wQOLJ3SF1b3xDkKrLy_OF-', 66),
  ('Triptofano 60 Cps', 'https://lh3.googleusercontent.com/d/1PDBJFE7BLvlTdnQvX-h-t932KEg_4RT0', 67),
  ('TST Lift Tribulus 600mg 120 Cps', 'https://lh3.googleusercontent.com/d/1clkWF_3n4YBaMzBurNM1eby3sogShbPM', 68),
  ('Uxi Amarelo com Unha de Gato 60 Cps', 'https://lh3.googleusercontent.com/d/10_ntxPrQg7rhD0Sf9tmD3WVpPJu5G4yZ', 69),
  ('Valeriana 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/10dLbPVQZ68jNgRrxjI_bu1PAx7dPNWAe', 70)
) as v(nome, imagem_url, ordem)
where mrc.slug = '4-elementos'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Alquimia Industria (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Thotynindoo 670ml', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'alquimia-industria'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Apinil (5 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Canela do Veio', 'https://lh3.googleusercontent.com/d/1-TjpsWXB04MqhEGEXIjooevdG-AZ_421', 1),
  ('Creme Pés e Mãos 190g Sebo de Carneiro', null, 2),
  ('Pomada Abelha 240g', null, 3),
  ('Pomada Cascavel 240g', null, 4),
  ('Pomada Sucuri 240g', null, 5)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'apinil'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Atacado Ervas (3 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Cavalinha 50g', null, 1),
  ('Hibisco Flor 50g', null, 2),
  ('Sene Folhas 50g', null, 3)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'atacado-ervas'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Bella Oil (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Óleo de Copaíba 30ml', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'bella-oil'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Bio Instinto (8 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Canela de Velho Pomada 150g', null, 1),
  ('Fisiofort Gold', null, 2),
  ('Fisiofort Pomada 150g', null, 3),
  ('Fisiofort Premium Pomada 150g', null, 4),
  ('Gel Detonador 21 Ervas 200g', null, 5),
  ('Gel Detonador 21 Ervas 240g', null, 6),
  ('Sabonete Íntimo Barbatimão e Aroeira', 'https://lh3.googleusercontent.com/d/1q5PrfJE0UTv3GxraDtnso6SkgnK6vsTu', 7),
  ('Sabonete Íntimo Morango com Champagne 200ml', null, 8)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'bio-instinto'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Bio Instinto / 18 Ervas (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Gel Cartilagem de Tubarão 150g Bisnaga', 'https://lh3.googleusercontent.com/d/17_kIjDvw1TAxyom67hsQZnEqfB_x44ld', 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'bio-instinto-18-ervas'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Bioceutica (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Xarope da Vovó Bioceutica', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'bioceutica'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Bioklein (16 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Ácido Hialurônico 60 Cps', null, 1),
  ('Colágeno Tipo II 60 Cps', 'https://lh3.googleusercontent.com/d/1VF3sqFi70xRHJN-ntLKSNvkYhdMmu0Rz', 2),
  ('Colágeno Verisol 60 Cps', 'https://lh3.googleusercontent.com/d/1VF3sqFi70xRHJN-ntLKSNvkYhdMmu0Rz', 3),
  ('Cramberry 500mg 60 Cps', 'https://lh3.googleusercontent.com/d/1-1CNhEYgkclLuIgCGs04oiEWYLpqZl3X', 4),
  ('Melatonina Triptofano 60 Cps', 'https://lh3.googleusercontent.com/d/1AQlczGe9Zmi4gXdRFuuQncEQGMmPcwV7', 5),
  ('Morobio 500mg 60 Cps', null, 6),
  ('Picolinato de Cromo 60 Cps', null, 7),
  ('Própolis com Alho 60 Cps', 'https://lh3.googleusercontent.com/d/1JulBl-uclYZPhEXPvqkmLRA-I40dLWmn', 8),
  ('Quitosana 60 Cps', 'https://lh3.googleusercontent.com/d/19aU4PmxSsIby_gGCN702PMT1C4LgydwJ', 9),
  ('Triomag Magnésio e Treonina 60 Cps', 'https://lh3.googleusercontent.com/d/1FQfKUGmdlQ-TsfMho5Lis60dD5-3ojvv', 10),
  ('Vitamina B12 60 Cps', null, 11),
  ('Vitamina C Bioklein 60 Cps', 'https://lh3.googleusercontent.com/d/1wdVMy8HDwIm0E_jyeYgOAnSbzmICFG6Q', 12),
  ('Vitamina C com Zinco 60 Cps', 'https://lh3.googleusercontent.com/d/1wdVMy8HDwIm0E_jyeYgOAnSbzmICFG6Q', 13),
  ('Vitamina D3 60 Cps', 'https://lh3.googleusercontent.com/d/1l9Dct1agbBWAGIm2yhn-GOAhM_JmJ6AJ5-', 14),
  ('Vitamina K2 60 Cps', 'https://lh3.googleusercontent.com/d/1Ze2ezPiJM0kNw3ydR3RGYC4V0YILrV5U', 15),
  ('Zinco Quelato 60 Cps', 'https://lh3.googleusercontent.com/d/1YxnDV4K9u0Th84eTIOuPWDut1UQ_RZv_', 16)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'bioklein'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Celliv (9 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Coezima', 'https://lh3.googleusercontent.com/d/18YFIC4nSJbkrNoxZ5KGmE9ythGYeKViP', 1),
  ('Colágeno com Vit C Zinco Abacaxi', 'https://lh3.googleusercontent.com/d/1VF3sqFi70xRHJN-ntLKSNvkYhdMmu0Rz', 2),
  ('Colágeno Hidro Limão', 'https://lh3.googleusercontent.com/d/1VF3sqFi70xRHJN-ntLKSNvkYhdMmu0Rz', 3),
  ('Colágeno Hydro Frutas Vermelhas', 'https://lh3.googleusercontent.com/d/1VF3sqFi70xRHJN-ntLKSNvkYhdMmu0Rz', 4),
  ('Colágeno Tipo 2', 'https://lh3.googleusercontent.com/d/1VF3sqFi70xRHJN-ntLKSNvkYhdMmu0Rz', 5),
  ('Livelle 60 Cps', null, 6),
  ('Óleo de Abacate Cps', null, 7),
  ('Óleo de Prímula Celliv', 'https://lh3.googleusercontent.com/d/1W4sfa4w8x2PHQ7WaAOKk9RSSmrSKIq8P', 8),
  ('Vitamina B12 Celliv', null, 9)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'celliv'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Demazon (3 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Multy Ervas Gel de Arnica 100g', 'https://lh3.googleusercontent.com/d/1CbuUkOTFqCKCXlbAt0dZteIT2UszMc2C', 1),
  ('Multy Ervas Gel de Arnica 500g', 'https://lh3.googleusercontent.com/d/1CbuUkOTFqCKCXlbAt0dZteIT2UszMc2C', 2),
  ('Seca Gordura 240g', 'https://lh3.googleusercontent.com/d/1WLe8oTR3Zqg8RP6h49CKL9Xq8dF-erzt', 3)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'demazon'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Empório das Ervas (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Amora NZ 60 Cps', 'https://lh3.googleusercontent.com/d/1hOaxVbWvdixKh49KYvJKq1TEW3l0eJya', 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'emporio-das-ervas'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Essencial (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Elixir de Inhame Essencial', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'essencial'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Essencial Bio (4 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Articular Ultra 60 Cps', null, 1),
  ('Glucomannan 120mg', null, 2),
  ('Magnésios 6 Essencial 60 Cps', 'https://lh3.googleusercontent.com/d/1YPpZVEohF_0tmPTeXBPYVWArGtMisYz-', 3),
  ('Vinagre de Maçã 60 Cps Essencial', null, 4)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'essencial-bio'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Faramel (2 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Xarope da Vovó 250ml', null, 1),
  ('Xarope Faramel 350ml', null, 2)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'faramel'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Fito Nature (2 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Espinheira Santa Fito Nature', 'https://lh3.googleusercontent.com/d/100zmNlZ7jpRAf1pj63WE5lJGC3lr9yOq', 1),
  ('Magnésio L Treonato', 'https://lh3.googleusercontent.com/d/1FQfKUGmdlQ-TsfMho5Lis60dD5-3ojvv', 2)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'fito-nature'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Flora 7 Ervas (2 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Balas de Gengibre Gengibrinha Pct 20x10', 'https://lh3.googleusercontent.com/d/1uxL7FmJ_qlPkX3iPgWukVKQO83A9alcx', 1),
  ('Levedo de Cerveja 400g', null, 2)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'flora-7-ervas'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Herbamix (5 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Guaraná da Amazônia Cps', 'https://lh3.googleusercontent.com/d/1d0I3T-pyC37EugNprkhHtjVsAuriDPW4', 1),
  ('Guaraná da Amazônia Pó', 'https://lh3.googleusercontent.com/d/1d0I3T-pyC37EugNprkhHtjVsAuriDPW4', 2),
  ('Guaraná Mix', null, 3),
  ('Ômega 3', 'https://lh3.googleusercontent.com/d/1zQhIa_DFSvZKcL0thnYaY3HfqsTi8YLG', 4),
  ('Ômega 3 6 9 120 Cps', 'https://lh3.googleusercontent.com/d/1zQhIa_DFSvZKcL0thnYaY3HfqsTi8YLG', 5)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'herbamix'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Herbolab (5 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Cafeína 60 Cps', null, 1),
  ('Force Prost 120 Cps', null, 2),
  ('Lactase 30 Cps', null, 3),
  ('Óleo de Alho 60 Cps', 'https://lh3.googleusercontent.com/d/1ToWGDRsOWWlXGZjMqf1jJbXdc7WjcIBc', 4),
  ('Óleo de Coco 60 Cps', null, 5)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'herbolab'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Landerlabs (6 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Carvão Vegetal Landerlabs', 'https://lh3.googleusercontent.com/d/1-nRVk3FBn7po5ER6QpTUg1a62OWlEjHH', 1),
  ('L Jack 120 Cps', null, 2),
  ('Maçã Peruana 120 Cps', 'https://lh3.googleusercontent.com/d/1SMwCmyxSYrZzCxpzCO9lvpPpJyRAWXfw', 3),
  ('Magnésio Dimalato', 'https://lh3.googleusercontent.com/d/1ziCoHQ34AIVV1HyxHYSKGS8puWVvp77b', 4),
  ('Testo Blend Tribulus + Maçã 120 Cps', 'https://lh3.googleusercontent.com/d/1C0FRUI6gOVL0CQSyev3W22d8d-5fssCk', 5),
  ('Testo Boost', null, 6)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'landerlabs'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Lysapharma (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Calcanhex', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'lysapharma'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Matugen (2 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Balas de Gengibre Display 10 Pct', 'https://lh3.googleusercontent.com/d/1uxL7FmJ_qlPkX3iPgWukVKQO83A9alcx', 1),
  ('Balas de Gengibre Display 25 Pct', 'https://lh3.googleusercontent.com/d/1uxL7FmJ_qlPkX3iPgWukVKQO83A9alcx', 2)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'matugen'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- MC Sales (4 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Sabonete Argila', null, 1),
  ('Sabonete Aroeira 90g', 'https://lh3.googleusercontent.com/d/1q5PrfJE0UTv3GxraDtnso6SkgnK6vsTu', 2),
  ('Sabonete Barbatimão 90g', 'https://lh3.googleusercontent.com/d/1q5PrfJE0UTv3GxraDtnso6SkgnK6vsTu', 3),
  ('Sabonete Enxofre 90g', null, 4)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'mc-sales'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Melfort (8 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Coenzima Q10 Vit C Gotas 30ml', 'https://lh3.googleusercontent.com/d/18YFIC4nSJbkrNoxZ5KGmE9ythGYeKViP', 1),
  ('Cúrcuma Gotas com Colágeno Tipo II 30ml', 'https://lh3.googleusercontent.com/d/1LieiQUqTXGF2c6K_KuGNfH8ghkQuxx0N', 2),
  ('Extrato de Própolis e Mel 30ml', 'https://lh3.googleusercontent.com/d/1JulBl-uclYZPhEXPvqkmLRA-I40dLWmn', 3),
  ('Feno Grego 60 Cps', null, 4),
  ('Melatonina', 'https://lh3.googleusercontent.com/d/1UMe3BMF4kyKxvrx8GXdLDzDFMRIFVaLa', 5),
  ('Melatonina com Triptofano Gotas', null, 6),
  ('Óleo de Abacate Gotas com Resveratrol e Coenzima Q10', null, 7),
  ('Picolinato de Cromo', null, 8)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'melfort'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Multinature (4 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Ella Mamy Creme 50g Lanolina', null, 1),
  ('Melaleuca Gotas 30ml', null, 2),
  ('Óleo de Amêndoas Doce 100ml', null, 3),
  ('Óleo de Rosa Mosqueta 30ml', null, 4)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'multinature'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Natti Vida (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Gotas Milagrosas 30ml', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'natti-vida'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Natural Ervas (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Amargo Natural Ervas 500ml', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'natural-ervas'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Nutribel (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Gengibre Cristalizado Nutribel 30g', 'https://lh3.googleusercontent.com/d/1uxL7FmJ_qlPkX3iPgWukVKQO83A9alcx', 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'nutribel'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Perfeita Alquimia (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Slim Top 100 Peso 60 Cps', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'perfeita-alquimia'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- San Jully (6 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Castanha da Índia Creme p/ as Pernas 240g', 'https://lh3.googleusercontent.com/d/1-pYkPkAlOAMRckOUWUbs8upb1toXw1hU', 1),
  ('Creme Pés e Mãos Sebo de Carneiro 240g', null, 2),
  ('Creme Pés e Mãos Sebo de Carneiro Bisnaga 200g', null, 3),
  ('Gel com Cartilagem de Tubarão 240g', 'https://lh3.googleusercontent.com/d/17_kIjDvw1TAxyom67hsQZnEqfB_x44ld', 4),
  ('Óleo de Menta 10ml', null, 5),
  ('Sabonete Íntimo Barbatimão Aroeira', 'https://lh3.googleusercontent.com/d/1q5PrfJE0UTv3GxraDtnso6SkgnK6vsTu', 6)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'san-jully'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Saúde e Vida (2 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('T Zeus 30 Afrodite 60 Cps', null, 1),
  ('T Zeus 30 Pegasus', null, 2)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'saude-e-vida'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Sem Mix / Herbamix (3 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Cortador de Comprimidos', null, 1),
  ('Porta Comprimido 4 Divisórias', null, 2),
  ('Porta Comprimido 8 Divisórias', null, 3)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'sem-mix-herbamix'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Soul (2 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Gel Massageador Cascavel 250g', null, 1),
  ('Gel Massageador Sucuri 240g', null, 2)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'soul'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Vinagre Orgânico São Francisco (1 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Vinagre de Maçã Orgânico São Francisco 500ml', null, 1)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'vinagre-organico-sao-francisco'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

-- Vitale Industria (3 produtos)
insert into public.catalogo_produtos (marca_id, nome, imagem_url, ordem)
select mrc.id, v.nome, v.imagem_url, v.ordem
from public.catalogo_marcas mrc
cross join (values
  ('Óleo de Cartamo 1000mg 120 Cps', 'https://lh3.googleusercontent.com/d/1GMD82kbWLoyFQRuT_-WO4FDX9qIkS47Y', 1),
  ('Óleo de Linhaça 500mg 60 Cps', null, 2),
  ('Ômega 3 1000mg 120 Cps Vitale', 'https://lh3.googleusercontent.com/d/1zQhIa_DFSvZKcL0thnYaY3HfqsTi8YLG', 3)
) as v(nome, imagem_url, ordem)
where mrc.slug = 'vitale-industria'
  and not exists (select 1 from public.catalogo_produtos p where p.marca_id = mrc.id);

commit;