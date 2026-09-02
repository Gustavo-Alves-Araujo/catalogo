#!/usr/bin/env python3
"""Extrai marcas e produtos dos HTMLs estaticos para JSON.

Uso: python3 scripts/extrair-catalogo.py
Gera: scripts/catalogo.json
Roda uma vez so, para popular o Supabase. Depois disso o banco e a fonte da verdade.
"""
import html
import json
import os
import re
import sys

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# card de marca no index: <a href="marca-x.html" ...> ... # NN ... <h3 ...>Nome</h3>
RE_MARCA = re.compile(
    r'<a href="(marca-[^"]+\.html)".*?'
    r'#\s*(\d+)</span>\s*'
    r'<h3[^>]*>(.*?)</h3>',
    re.S)

# card de produto na pagina da marca
RE_PRODUTO = re.compile(r'<article data-card data-product="[^"]*".*?</article>', re.S)
RE_IMG = re.compile(r'<img src="([^"]+)"')
RE_NOME = re.compile(r'<h3[^>]*>(.*?)</h3>', re.S)


def texto(bruto):
    return html.unescape(re.sub(r'<[^>]+>', '', bruto)).strip()


def slug_de(arquivo):
    return arquivo[len('marca-'):-len('.html')]


def produtos_de(arquivo):
    caminho = os.path.join(RAIZ, arquivo)
    if not os.path.exists(caminho):
        return None
    fonte = open(caminho, encoding='utf-8').read()
    itens = []
    for i, card in enumerate(RE_PRODUTO.findall(fonte)):
        nome = RE_NOME.search(card)
        if not nome:
            continue
        img = RE_IMG.search(card)
        itens.append({
            'nome': texto(nome.group(1)),
            'imagem_url': img.group(1) if img else None,
            'ordem': i + 1,
        })
    return itens


def main():
    index = open(os.path.join(RAIZ, 'index.html'), encoding='utf-8').read()
    marcas, vistos, alertas = [], set(), []

    for arquivo, num, nome in RE_MARCA.findall(index):
        if arquivo in vistos:
            continue
        vistos.add(arquivo)
        itens = produtos_de(arquivo)
        if itens is None:
            alertas.append(f'{arquivo}: linkado no index mas o arquivo nao existe')
            continue
        if not itens:
            alertas.append(f'{arquivo}: nenhum produto encontrado')
        marcas.append({
            'slug': slug_de(arquivo),
            'nome': texto(nome),
            'ordem': int(num),
            'arquivo_origem': arquivo,
            'produtos': itens,
        })

    # paginas de marca que existem no disco mas ninguem linka no index
    for arquivo in sorted(os.listdir(RAIZ)):
        if arquivo.startswith('marca-') and arquivo.endswith('.html') and arquivo not in vistos:
            alertas.append(f'{arquivo}: existe no disco mas nao esta linkado no index')

    saida = {'marcas': marcas}
    destino = os.path.join(RAIZ, 'scripts', 'catalogo.json')
    with open(destino, 'w', encoding='utf-8') as f:
        json.dump(saida, f, ensure_ascii=False, indent=2)

    total = sum(len(m['produtos']) for m in marcas)
    print(f'{len(marcas)} marcas, {total} produtos -> scripts/catalogo.json')
    sem_img = sum(1 for m in marcas for p in m['produtos'] if not p['imagem_url'])
    print(f'{sem_img} produtos sem imagem ("Em breve")')
    for a in alertas:
        print('  ! ' + a, file=sys.stderr)


if __name__ == '__main__':
    main()
