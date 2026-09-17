# Biblioteca Digital UniFECAF — Versão Semântica (Web 3.0)

Este repositório contém a primeira versão da interface da Biblioteca Digital UniFECAF, focada em semântica (JSON-LD), acessibilidade, responsividade e preparação para features da Web 3.0 (personalização e dados conectados).

Resumo rápido
- Front-end: HTML, CSS (organizado em css/style.css) e scripts leves para enriquecimento client-side.
- Dados: `assets/books.json` é a fonte de livros usada pelo catálogo dinâmico.
- Mock API: `server.js` (Node/Express) para desenvolvimento local; Dockerfile incluído para execução consistente.
- Relatório teórico: `README.txt` contém o relatório solicitado (análise, paleta, tipografia, decisões, estratégias de responsividade e acessibilidade).

Estrutura do projeto
```
biblioteca-unifecaf/
├── index.html
├── catalog.html
├── dashboard.html
├── css/
│   └── style.css
├── assets/
│   ├── imagens/
│   └── js/
│       ├── main.js
│       ├── catalog.js
│       └── book.js
├── server.js
├── package.json
├── Dockerfile
└── README.txt   # Relatório teórico completo (entregável)
```

Como executar localmente
- Modo estático (rápido): abra `index.html` diretamente no navegador para validar layout e navegação.

- Modo com mock API (recomendado):
  1. Instale Node.js (>=16) e npm
  2. No diretório do projeto:
     npm install
     npm start
  3. Acesse: http://localhost:3000

- Modo Docker:
  1. Instale Docker
  2. Na pasta do projeto:
     docker build -t biblioteca-unifecaf:latest .
     docker run --rm -p 3000:3000 biblioteca-unifecaf:latest
  3. Acesse: http://localhost:3000

Paleta de cores e tipografia (resumo)
- Paleta aplicada (variáveis CSS em css/style.css):
  - --color-primary: #0A4D8C
  - --color-primary-variant: #083a66
  - --color-accent: #FFB703
  - --color-bg: #f4f7fb
  - --color-surface: #ffffff
  - --color-text: #072236
- Tipografia: Inter (Google Fonts) — família moderna e legível.

Melhorias e recursos aplicados
- Semântica: blocos JSON-LD (Library, WebSite, Book) e marcação semântica HTML5 (header, nav, main, article, footer).
- Acessibilidade: foco visível, rótulos ARIA onde necessário, imagens com alt e contrastes revisados.
- Responsividade: CSS Grid e media queries para adaptar colunas e elementos a diferentes larguras.
- PWA (básico): manifest.json e service-worker.js com cache estático simples (demo/offline limitado).
- Tema visual: o projeto foi mantido em tema claro, sem toggle de tema escuro para manter visual consistente e profissional.

Relatório teórico (entregável)
- O arquivo `README.txt` contém o relatório completo pedido na disciplina (análises, justificativas, estratégias e instruções para capturas). Verifique `README.txt` no diretório do projeto.

Ferramentas de apoio e scripts
- push-script.ps1: script PowerShell para inicializar repositório local, adicionar remote e enviar (rodar localmente).
- run-contrast.ps1: helper PowerShell que executa o verificador Node localmente (pode ser bloqueado por políticas de execução no Windows; use `node assets/js/contrast-check.js css/style.css` diretamente se necessário).
- assets/js/contrast-check.js: verificador básico de contraste que analisa as variáveis CSS em `css/style.css` e reporta ratios de contraste para as principais combinações (claro/escuro).
- npm script: `npm run contrast` executa o verificador localmente (requer Node.js instalado).

Próximos passos recomendados
- Inserir screenshots desktop/mobile em `assets/screenshots/` e anexar ao relatório (README.txt) para geração de PDF.
- Rodar auditoria de acessibilidade completa (axe / Lighthouse) e aplicar correções pontuais — posso ajudar a automatizar este processo.
- Implementar leitor de PDFs/EPUBs (PDF.js / Readium) para leitura online.
- Se desejar, posso gerar automaticamente um checklist de contraste e aplicar correções de CSS.

Contato e apoio
- Posso ajudar a preparar o deploy (GitHub Pages para front estático + Render/Vercel para mock API) ou a integrar com um backend real (Node + SQLite/Postgres).

Finalização da entrega
- Projeto finalizado e empacotado em ZIP em: C:\Users\Usuário\Documents\HTML\biblioteca-unifecaf-final.zip
- Validação concluída: contraste claro e escuro passou nos checks principais; acessibilidade e responsividade foram revisadas com base no layout real do navegador.

Data da última atualização: 2026-09-17T12:39:41-03:00

