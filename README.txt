Relatório Teórico — Biblioteca Digital UniFECAF (versão prática)

link da paigina abra no navegador: http://localhost:3000

1. Análise do problema e do protótipo disponibilizado

O desafio consistiu em transformar um protótipo de baixa fidelidade em uma interface web funcional, responsiva e alinhada à identidade institucional da UniFECAF, usando apenas HTML e CSS (com complementos JavaScript para comportamento client-side). Além disso, foi solicitado explorar conceitos de Web 3.0 (personalização, dados conectados e preparação para integração com IA).

A principal restrição técnica: não usar construtores ou templates prontos; a solução deveria demonstrar domínio da estrutura HTML e da estilização CSS. A solução entregue prioriza:
- descoberta (campo de busca em destaque no hero);
- navegação clara entre catálogo, destaques, serviços e páginas de detalhe;
- semântica dos dados (JSON-LD/schema.org) para tornar os recursos legíveis por agentes e motores de IA;
- preparação para integração futura com backend (mock API + Dockerfile fornecidos).

2. Definição do público-alvo

O público-alvo principal é:
- Estudantes de graduação e pós-graduação da UniFECAF (busca de livros, materiais e apoio ao estudo);
- Professores e pesquisadores (referências, metodologias, materiais de suporte);
- Usuários administrativos (serviços de empréstimo, interbiblioteca);
- Agentes automatizados e serviços de indexação (motores de busca, assistentes acadêmicos) — isso motiva a inclusão de dados vinculados (JSON-LD).

3. Paleta de cores e tipografia escolhidas

Paleta (valores aplicados no CSS nesta versão recente):
- Primária: #0A4D8C — azul institucional mais vivo e moderno
- Variantes: --primary-variant: #083a66 (tom mais escuro para hover/rodapé)
- Acento: #FFB703 — amarelo quente para CTAs e destaques
- Fundo: #f4f7fb — neutro suave para diminuir o contraste agressivo
- Superfície: #ffffff — cartões e superfícies limpas
- Texto: #072236 — tom escuro para leitura confortável

Motivos da atualização de cores (melhorias aplicadas em todas as páginas):
- A paleta original foi refinada para melhorar contraste, harmonia entre elementos e aparência moderna sem perder identidade institucional.
- O azul primário foi clarificado (#0A4D8C) para ficar mais contemporâneo e legível em botões e cabeçalhos.
- O amarelo de acento foi ajustado a #FFB703 para melhor visibilidade e contraste com o azul.
- O fundo ficou um pouco mais neutro (#f4f7fb) para reduzir fadiga visual em leituras prolongadas.
- Essas alterações foram aplicadas centralmente via variáveis CSS (:root) para que todas as páginas herdem as mudanças automaticamente.

Tipografia:
- Inter (Google Fonts) — família neutra, moderna e altamente legível em telas, com boa variação de pesos para hierarquia (300/400/600/700).

4. Justificativa das principais decisões visuais

Hierarquia e priorização do conteúdo:
- Hero com busca em destaque: biblioteca digital é sobre descoberta — a busca é o elemento principal.
- Cards para livros/categorias: padrão visual familiar para catálogos, fácil escaneabilidade.
- Contêiner centralizado e largura máxima: facilita leitura em desktops largos, evita linhas de texto muito longas.
- Sombreamento e bordas arredondadas: delimitação suave dos componentes, sem criar ruído visual.

Acessibilidade e contraste:
- Escolha de cores com contraste adequado para texto e botões.
- Foco visível e estilos de foco para navegação por teclado.

Semântica e dados:
- Inclusion of JSON-LD and schema.org types (Library, Book, Service) to make content machine-readable and ready for AI/agents.

5. Explicação da estrutura das seções

Arquitetura das páginas:
- Header: logo, navegação e toggle de personalização (client-side) — permite ativar preferências locais.
- Index (Início/Hero): título, lead, busca e chips de acesso rápido.
- Catálogo (catalog.html): grid dinâmico de livros, busca, filtros por categoria, ordenação, paginação client-side (catalog.js usando assets/books.json).
- Destaques (destaques.html): grade/carrossel de recomendações.
- Serviços (services.html): lista de serviços com ancoragem para quick links (renovação, atendimento, interbiblioteca, ambiente de leitura).
- Páginas de detalhe (book.html?id=...): metadados do livro, JSON-LD gerado dinamicamente, sinopse, ações (ler, solicitar empréstimo — simuladas).
- Dashboard (dashboard.html): página central que agrega busca, destaques, preview do catálogo e links rápidos — ponto de entrada profissional.
- Arquivos de apoio: assets/books.json e books.csv (metadados reais), Dockerfile, server.js (mock API) para desenvolvimento.

6. Descrição das estratégias de responsividade

Técnicas adotadas:
- CSS Grid e propriedades responsivas: grid-template-columns com repeat / auto-fit / minmax para adaptar colunas conforme largura.
- Breakpoints explicítos: >1100px (4 colunas), 700–1000px (2 colunas), <=700px (1 coluna) — garante que títulos, capas e botões não fiquem comprimidos.
- Imagens com object-fit:cover e dimensões relativas para evitar distorção no redimensionamento.
- Hero adaptável: em telas pequenas a imagem passa abaixo do texto para priorizar o campo de busca.

7. Aplicação de princípios básicos de acessibilidade

Medidas aplicadas:
- Uso de marcação semântica: header, nav, main, section, article, footer, aside e address quando aplicável.
- ARIA e roles: forms e elementos interativos receberam roles/aria-labels (ex.: role="search", aria-label nos botões e no toggle de personalização).
- Rótulos ocultos (visually-hidden) para inputs quando o rótulo não é visível.
- Foco visível e contraste: regras CSS de :focus para navegação por teclado e escolha de cores para garantir contraste legível.
- Conteúdo carregado dinamicamente inclui atributos alt nas imagens; JSON-LD fornece metadados semânticos que complementam a usabilidade por agentes.

8. Respostas fundamentadas às questões orientadoras

Como transformar o protótipo em uma interface moderna, responsiva e alinhada à identidade UniFECAF?
- Interpretar as áreas funcionais do protótipo e mapear para seções semânticas (HTML); priorizar descoberta (busca) e navegação clara.
- Aplicar sistema de design simples: tipografia, paleta, espaçamento e componentes reutilizáveis (cards).
- Implementar responsividade com CSS Grid e media queries, testando em breakpoints reais.
- Tornar os dados semânticos (JSON-LD) para que agentes inteligentes consigam consumir o acervo.
- Preparar infraestrutura: mock API (server.js), Dockerfile e manifest PWA para permitir testes mais realísticos e integração contínua.

9. Capturas das versões desktop e mobile do site

Observação prática: neste artefato entregue (README.txt) não é possível incluir imagens binárias. Para cumprir o requisito de capturas, seguem instruções e caminhos onde devem ser colocadas as imagens reais (após captura):
- Local padrão para capturas:
  - assets/screenshots/desktop.png  (ou .jpg)
  - assets/screenshots/mobile.png   (ou .jpg)

Como gerar capturas recomendadas:
- Desktop:
  1. Abra o arquivo index.html no navegador em tela cheia (resolução >= 1366x768 ou 1920x1080).
  2. Ajuste a área para mostrar o hero e lista de destaques (ou outra seção importante).
  3. Capturar a tela (PrintScreen) e salvar como assets/screenshots/desktop.png.

- Mobile:
  1. Abra index.html no navegador e ative o modo dispositivo (DevTools → Toggle device toolbar) ou abra em um smartphone.
  2. Ajuste para um dispositivo comum (por exemplo iPhone SE/12/13) e capture a tela.
  3. Salve como assets/screenshots/mobile.png.

Quando as imagens estiverem presentes na pasta indicada, o relatório em HTML (se desejar re-gerar) poderá incluir as imagens no PDF final. Se desejar, eu posso inserir as capturas no relatório e regenerar a versão imprimível.

10. Decisões técnicas aplicadas no desenvolvimento (detalhamento para avaliação)

- Tema e contraste: a interface foi padronizada em tema claro apenas, mantendo consistência visual e uma identidade institucional limpa. Um verificador básico de contraste foi adicionado (assets/js/contrast-check.js) e pode ser executado localmente para validar ratios de contraste no tema claro.

- Como rodar o verificador de contraste (local):
  1. Instale Node.js (>=14/16)
  2. No diretório do projeto rode:
     node assets/js/contrast-check.js css/style.css
  3. Como alternativa, use o helper PowerShell `run-contrast.ps1` (pode necessitar ajustar políticas de execução no Windows ou executar diretamente o comando node acima).


- Estrutura de dados: assets/books.json contém registros reais (id, title, author, year, isbn, language, publisher, cover, description, categories, available). Esse arquivo é usado pelo front-end para renderizar o catálogo dinamicamente, sem necessidade imediata de backend.
- PWA / Offline: manifest.json e service-worker.js oferecem cache estático básico (lista de rotas), permitindo uso básico offline e testes de instalação como app.
- Mock API: server.js (Node/Express) fornece endpoints REST úteis (/api/books, /api/books/:id e POST /api/borrow) para um fluxo de desenvolvimento que pode ser substituído por um backend real.
- Docker: Dockerfile e .dockerignore permitem empacotar a aplicação (mock API + static) para execução consistente em desenvolvimento/servidor.
- Segurança e produção: lembrete — para produção é necessário configurar autenticação robusta (SSO/CAS/OAuth/LDAP), proteção contra XSS/CSRF, controles de CORS e políticas de backup e logs.

11. Observações finais e próximos passos sugeridos

Próximos passos para transformar a demo em plataforma institucional completa:
- Implementar backend com persistência (Postgres/SQLite) e endpoints autenticados para empréstimos, reservas e histórico.
- Integrar autenticação institucional (SSO/CAS/OAuth) para controlar acesso e privacidade.
- Integrar um leitor EPUB/PDF (p.ex. PDF.js ou Readium) para leitura online com controle de direitos se necessário.
- Índice semântico avançado: expor endpoints que retornem JSON-LD para permitir agentes e motores de IA a consultar por tópicos e recomendações.
- Testes de acessibilidade (WCAG) com ferramentas automatizadas (axe, Lighthouse) e correções manuais.

Entrega técnica fornecida
- Estrutura de arquivos desenvolvida e testada localmente (HTML/CSS/JS), com catalog.js, book.js, assets/books.json, books.csv, Dockerfile, server.js e push-script.ps1 para facilitar envio ao Git.

Se desejar, posso:
- Inserir as capturas reais no relatório e gerar um PDF finalizado para entrega;
- Implementar o backend completo (Node + SQLite) e um docker-compose que sobe front+api para testes locais;
- Ajudar na publicação (GitHub Pages para front-end estático + Render/Vercel para API) e configurar CI/CD.

---
Data da elaboração: 2026-09-17T12:39:41-03:00
Arquivo: README.txt — entregue no diretório do projeto: C:\Users\Usuário\Documents\HTML\biblioteca-unifecaf\README.txt
Projeto finalizado e empacotado em ZIP em: C:\Users\Usuário\Documents\HTML\biblioteca-unifecaf-final.zip

Fim do relatório.