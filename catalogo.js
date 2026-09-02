/* Camada de dados do catalogo: le marcas e produtos do Supabase e monta os cards.
   Usado por index.html, marca.html, busca.html e admin.html. */
(function (global) {
  'use strict';

  var SUPABASE_URL = 'https://wkgldercybaoyonfmsjy.supabase.co';
  var SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndrZ2xkZXJjeWJhb3lvbmZtc2p5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIzMjEyMTMsImV4cCI6MjA5Nzg5NzIxM30.IgtnwHMyEsL_npVfU7IcJuBo3rBGMwnVjfoh7HNgXnY';
  var WHATSAPP = '5534991783994';
  var BUCKET = 'catalogo';

  // ciclo de cores por marca, igual ao catalogo estatico anterior
  var CORES = ['#728035', '#D4652E', '#536028', '#8B5E3C', '#2D6A4F', '#C65D21'];

  var sb = global.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

  var SVG_WHATS = '<svg viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4 shrink-0"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347z"/><path d="M12 0C5.373 0 0 5.373 0 12c0 2.089.537 4.09 1.562 5.853L0 24l6.305-1.534A11.954 11.954 0 0012 24c6.627 0 12-5.373 12-12S18.627 0 12 0zm0 21.818a9.818 9.818 0 01-5.001-1.368l-.36-.213-3.732.978.997-3.645-.234-.374A9.818 9.818 0 1112 21.818z"/></svg>';
  var SVG_SEM_IMAGEM = '<div class="w-full h-full flex flex-col items-center justify-center gap-2" style="color:#e8e5de"><div style="color:#e8e5de"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" class="w-9 h-9"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2z" stroke-dasharray="3 3"/><path d="M12 6c0 0-5 3.5-5 7a5 5 0 0010 0c0-3.5-5-7-5-7z"/><path d="M12 13v5"/></svg></div><span class="text-xs font-medium" style="color:#e8e5de">Em breve</span></div>';
  var SVG_SETA = '<svg class="w-4 h-4 shrink-0" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M5 12h14M12 5l7 7-7 7"/></svg>';

  function esc(s) {
    return String(s == null ? '' : s)
      .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;').replace(/'/g, '&#39;');
  }

  function corDaMarca(ordem) {
    var i = (Number(ordem) || 1) - 1;
    return CORES[((i % CORES.length) + CORES.length) % CORES.length];
  }

  function linkProduto(nome) {
    return 'https://wa.me/' + WHATSAPP + '?text=' + encodeURIComponent(
      'Olá! Tenho interesse no produto: ' + nome + '. Podem me informar disponibilidade e preço?');
  }

  function linkMarca(nome) {
    return 'https://wa.me/' + WHATSAPP + '?text=' + encodeURIComponent(
      'Olá! Tenho interesse nos produtos da ' + nome + '. Podem me ajudar?');
  }

  /* ------------------------------------------------------------- consultas */

  function marcas() {
    return sb.from('catalogo_marcas')
      .select('id,slug,nome,descricao,logo_url,ordem,ativo')
      .eq('ativo', true).order('ordem').then(desembrulha);
  }

  function marcasComProdutos() {
    return sb.from('catalogo_marcas')
      .select('id,slug,nome,descricao,logo_url,ordem,ativo,catalogo_produtos(id,nome,imagem_url,ordem,ativo)')
      .eq('ativo', true).order('ordem').then(desembrulha).then(function (lista) {
        lista.forEach(function (m) {
          m.produtos = (m.catalogo_produtos || [])
            .filter(function (p) { return p.ativo; })
            .sort(function (a, b) { return a.ordem - b.ordem; });
          delete m.catalogo_produtos;
        });
        return lista;
      });
  }

  function marcaPorSlug(slug) {
    return sb.from('catalogo_marcas')
      .select('id,slug,nome,descricao,logo_url,ordem,ativo,catalogo_produtos(id,nome,imagem_url,ordem,ativo)')
      .eq('slug', slug).eq('ativo', true).maybeSingle().then(function (r) {
        if (r.error) throw r.error;
        if (!r.data) return null;
        var m = r.data;
        m.produtos = (m.catalogo_produtos || [])
          .filter(function (p) { return p.ativo; })
          .sort(function (a, b) { return a.ordem - b.ordem; });
        delete m.catalogo_produtos;
        return m;
      });
  }

  function desembrulha(r) {
    if (r.error) throw r.error;
    return r.data || [];
  }

  /* ------------------------------------------------------------ marcacao */

  function cardProduto(p, cor) {
    var temImagem = !!p.imagem_url;
    var fundo = temImagem ? '#ffffff' : '#f7f6f2';
    var acento = cor || CORES[0];
    var midia = temImagem
      ? '<img src="' + esc(p.imagem_url) + '" alt="' + esc(p.nome) + '" loading="lazy" class="w-full h-full object-contain" style="padding:16px"/>'
      : SVG_SEM_IMAGEM;
    return '' +
      '<article data-card data-product="' + esc(String(p.nome).toLowerCase()) + '" class="flex flex-col rounded-2xl overflow-hidden transition-all duration-300 group" style="background:' + fundo + ';border:1.5px solid #e8e5de;opacity:0;transform:translateY(20px)">' +
        '<div class="relative overflow-hidden" style="height:180px;background:' + (temImagem ? 'white' : '#e8e5de') + '">' + midia + '</div>' +
        '<div class="flex flex-col flex-1 p-4 gap-3">' +
          '<h3 class="text-sm font-semibold leading-snug flex-1" style="color:#1a1a14">' + esc(p.nome) + '</h3>' +
          '<a href="' + esc(linkProduto(p.nome)) + '" target="_blank" rel="noopener" ' +
             'class="flex items-center justify-center gap-2 py-2.5 rounded-xl text-sm font-semibold text-white transition-all duration-200" ' +
             'style="background:' + acento + '" onmouseover="this.style.background=\'#D4652E\'" onmouseout="this.style.background=\'' + acento + '\'">' + SVG_WHATS + ' Pedir</a>' +
        '</div>' +
      '</article>';
  }

  function cardMarca(m, indice) {
    var cor = corDaMarca(m.ordem);
    var qtd = (m.produtos || []).length;
    var comImagem = (m.produtos || []).filter(function (p) { return p.imagem_url; }).slice(0, 3);
    var miniaturas = comImagem.map(function (p) {
      return '<img src="' + esc(p.imagem_url) + '" alt="" loading="lazy" class="w-12 h-12 rounded-lg object-contain" style="background:#f7f6f2;padding:4px"/>';
    }).join('');
    var resto = qtd - comImagem.length;
    if (resto > 0) {
      miniaturas += '<div class="w-12 h-12 rounded-lg flex items-center justify-center text-xs font-bold" style="background:' + cor + '15;color:' + cor + '">+' + resto + '</div>';
    }
    var num = String(m.ordem).padStart(2, '0');
    return '' +
      '<a href="marca.html?m=' + encodeURIComponent(m.slug) + '" data-anim="up" data-delay="' + (indice % 3) * 80 + '" class="flex flex-col rounded-2xl overflow-hidden transition-all duration-300 opacity-0 group" ' +
         'style="background:#ffffff;border:1.5px solid #e8e5de" ' +
         'onmouseover="this.style.boxShadow=\'0 8px 32px rgba(0,0,0,.10)\';this.style.borderColor=\'' + cor + '\'" ' +
         'onmouseout="this.style.boxShadow=\'none\';this.style.borderColor=\'#e8e5de\'">' +
        '<div class="h-1" style="background:' + cor + '"></div>' +
        '<div class="p-5 flex flex-col gap-4 flex-1">' +
          '<div class="flex items-start justify-between gap-2">' +
            '<div>' +
              '<span class="text-xs font-bold uppercase tracking-widest" style="color:' + cor + '"># ' + num + '</span>' +
              '<h3 class="text-base font-bold mt-0.5 leading-snug" style="color:#1a1a14">' + esc(m.nome) + '</h3>' +
            '</div>' +
            '<span class="shrink-0 text-xs font-semibold px-2 py-0.5 rounded-full" style="background:' + cor + '15;color:' + cor + '">' + qtd + ' prod.</span>' +
          '</div>' +
          '<div class="flex flex-wrap gap-2">' + miniaturas + '</div>' +
          '<div class="mt-auto pt-3 flex items-center gap-1 text-xs font-semibold transition-colors duration-200" style="color:' + cor + ';border-top:1px solid #e8e5de">Ver produtos ' + SVG_SETA + '</div>' +
        '</div>' +
      '</a>';
  }

  /* ------------------------------------------------- comportamento dos cards */

  // Chamar depois de injetar cards no DOM: entrada, hover e busca voltam a valer.
  function ativarCards(raiz) {
    var cards = (raiz || document).querySelectorAll('[data-card]:not([data-pronto])');
    var obs = new IntersectionObserver(function (entries) {
      entries.forEach(function (e, idx) {
        if (!e.isIntersecting) return;
        var el = e.target;
        setTimeout(function () {
          el.style.transition = 'opacity .5s ease, transform .5s ease, box-shadow .2s';
          el.style.opacity = '1';
          el.style.transform = 'translateY(0)';
        }, idx * 60);
        obs.unobserve(el);
      });
    }, { threshold: .1 });
    cards.forEach(function (c) {
      c.setAttribute('data-pronto', '');
      obs.observe(c);
      c.addEventListener('mouseenter', function () {
        this.style.boxShadow = '0 8px 32px rgba(0,0,0,.10)';
        this.style.transform = 'translateY(-4px)';
      });
      c.addEventListener('mouseleave', function () {
        this.style.boxShadow = 'none';
        this.style.transform = 'translateY(0)';
      });
    });
  }

  // Filtro por texto sobre os cards ja renderizados.
  function ligarBusca(opcoes) {
    var input = document.getElementById(opcoes.input || 'q');
    var vazio = document.getElementById(opcoes.vazio || 'empty');
    var botaoLimpar = document.getElementById(opcoes.limpar || 'clr-btn');
    if (!input) return;

    function filtrar(termo) {
      termo = (termo || '').toLowerCase().trim();
      var secoes = document.querySelectorAll('[data-brand-section]');
      var totalVisivel = 0;
      secoes.forEach(function (sec) {
        var visiveis = 0;
        sec.querySelectorAll('[data-card]').forEach(function (c) {
          var bate = !termo || c.getAttribute('data-product').indexOf(termo) > -1;
          c.style.display = bate ? '' : 'none';
          if (bate) visiveis++;
        });
        sec.style.display = visiveis ? '' : 'none';
        totalVisivel += visiveis;
      });
      if (vazio) vazio.classList.toggle('hidden', totalVisivel > 0);
      if (botaoLimpar) botaoLimpar.classList.toggle('hidden', !input.value);
    }

    input.addEventListener('input', function () { filtrar(this.value); });
    if (botaoLimpar) {
      botaoLimpar.addEventListener('click', function () {
        input.value = '';
        input.focus();
        filtrar('');
      });
    }
    var termoUrl = new URLSearchParams(location.search).get('q');
    if (termoUrl) { input.value = termoUrl; }
    filtrar(input.value);
    return filtrar;
  }

  function urlPublica(caminho) {
    return sb.storage.from(BUCKET).getPublicUrl(caminho).data.publicUrl;
  }

  global.Catalogo = {
    sb: sb,
    BUCKET: BUCKET,
    CORES: CORES,
    corDaMarca: corDaMarca,
    esc: esc,
    marcas: marcas,
    marcasComProdutos: marcasComProdutos,
    marcaPorSlug: marcaPorSlug,
    cardProduto: cardProduto,
    cardMarca: cardMarca,
    ativarCards: ativarCards,
    ligarBusca: ligarBusca,
    linkMarca: linkMarca,
    linkProduto: linkProduto,
    urlPublica: urlPublica
  };
})(window);
