# Relatório Teórico — Biblioteca Digital UniFECAF (Web 3.0 / Semântica)

## Visão geral
Esta versão da interface foi refeita atendendo ao briefing inicial e expandida para uma abordagem Web 3.0 semântica. O foco: personalização controlada pelo usuário, metadados vinculados (JSON-LD) para tornar o acervo interpretável por máquinas e suportar futuros serviços de IA e dados conectados.

## 1. Análise do problema e do protótipo
O protótipo solicita uma interface simples e responsiva que permita visualização do acervo, identificação de categorias, destaques e serviços. A versão semântica adiciona camadas de metadados e estruturas que facilitam integração com agentes e serviços inteligentes (motores de recomendação, assistentes, pesquisas semânticas).

## 2. Público-alvo
Estudantes, professores, pesquisadores e serviços automatizados (agentes de busca, assistentes acadêmicos) que se beneficiam de dados bem estruturados para recomendações e agregações.

## 3. Paleta de cores e tipografia
- Primária: #002b5b (azul profundo)
- Acento: #f2b705 (amarelo)
- Fundo: #f7fbff / superfície branca
- Tipografia: Inter (Google Fonts) — neutra, legível e moderna

## 4. Decisões visuais e semânticas
- HTML semântico (main, section, article, nav, header, footer, aside) e uso de microdata/schema.org e JSON-LD para tornar o conteúdo legível por máquinas.
- Cartões (cards) para itens do acervo: fáceis de identificar visualmente e semanticamente (itemtype Book).
- Personalização orientada ao usuário: controle client-side (checkbox) que simula preferências locais, preservando privacidade (dados permanecem no dispositivo). Essa técnica demonstra um princípio Web 3.0: controle do usuário sobre seus dados.

## 5. Estrutura das seções
- Header: logo, navegação e toggle de personalização.
- Hero: busca e destaque da proposta.
- Catálogo: categorias semânticas.
- Destaques: objetos Book (schema.org) e painel de recomendações (CSS-only para demo).
- Serviços: items do tipo Service.
- Contato e Footer.

## 6. Estratégias de responsividade
- Grid CSS que adapta colunas (4 → 2 → 1) com media queries.
- Imagens e capas com object-fit para evitar distorção.
- Layout fluido com containers centralizados.

## 7. Acessibilidade e privacidade
- Uso de roles, labels, elementos HTML semânticos.
- Preferências do usuário são controladas localmente (checkbox) para demonstrar respeito à privacidade — não há envio de dados a terceiros nesta versão.

## 8. Integração com IA e dados conectados (proposta)
- JSON-LD já incluído para organização e amostras de livros: permite que agentes e motores indexem os recursos.
- Estratégias futuras:
  - Implementar endpoints Linked Data (HTTP APIs que servem JSON-LD) para consulta por conceitos.
  - Conectar a um motor de recomendação que consome os metadados e perfis (mantidos com consentimento do usuário).
  - Assistente conversacional que consome schema.org/Book e Service para responder perguntas (p.ex. "livros sobre redes publicados depois de 2020").

## 9. Como isso atende à pergunta orientadora
Transformar um protótipo em uma interface moderna e semântica envolve não só o visual, mas a estrutura dos dados: HTML semântico + JSON-LD fornece uma base para experiências personalizadas, IA e dados conectados, mantendo usabilidade e acessibilidade.

## 10. Capturas
Para gerar as capturas, abrir index.html no navegador em tela desktop e mobile (ferramentas de desenvolvedor). Salvar imagens em assets/screenshots/ se desejar incluí-las no PDF final.

---

Observação: este é um relatório base. Para a entrega formal em PDF, converter este markdown para PDF e anexar as capturas de tela das versões Desktop e Mobile.
