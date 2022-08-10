# Arma 3: Para Novos Editores [Framework]
>*Dependências: CBA + ACE*

Isto não é uma missão, mas sim um Framework ou Sandbox ou laboratório, se você preferir. Em outras palavras, "Para Novos Editores" é um pacote de instruções para acelerar o aprendizado de novos editores de missões no Arma 3. O foco aqui é instruir a como desenvolver soluções compatíveis com singleplayer e multiplayer, porém priorizando configurações para multijogadores em missões COOP.

Aqui você encontrará:

**SPAWNANDO VEÍCULOS E TRIPULAÇÕES**

- Como spawnar veículo via trigger;
- Como spawnar veículo já com tripulação via trigger;
- Como spawnar veículo já em movimento (sem waypoints);
- Como spawnar veículo já em movimento (com waypoints);
- Como spawnar veículo já em movimento (com waypoints em patrulha);
- Como spawnar veículo com combustível e/ou vida já baixo;
- Como spawnar uma aeronave já em voo (sem waypoints);
- Como spawnar uma aeronave já em voo (com waypoints);
- Como re-spawnar veículos automaticamente;
- Básico sobre deletar veículos e tripulações;
- Probabilidade: se o veículo X spawnar, o veículo Y e Z não spawnarão;

**SPAWNANDO INFANTARIA**

- Básico: Grupo ou soldado spawnando em 1 de 3 pontos, aleatoriamente;
- Básico: Grupo ou soldado spawnando num raio de uma área pré-determinada;
- Grupo ou soldado spawnando aleatoriamente (dinamicamente via script) [simples];
- Grupo ou soldado spawnando aleatoriamente (dinamicamente via script) [modo avançado];

**COMPORTAMENTOS ESPECIAIS PARA VEÍCULOS**

- Trancando e destrancando veículo para players;
- Trancando apenas posição de motorista;
- Trancando compartimento de carga;
- Ligar motor do veículo sem player ou bot dentro;
- Ligar luzes do veículo sem player ou bot dentro;
- Manter luzes do veículo desligadas mesmo rodando a noite;
- Desativando apenas a visão termal dos carros de combate;
- Forçando assinatura térmica em qualquer veículo mesmo desligado;
- Removendo um tipo de munição de carros de combate;
- Veículo de bot em combate, forçar para gunner não desembarcar;
- Veículo de bot em combate, forçar para ninguém desembarcar;
 
**ARSENAL**

- Testando arsenal da infantaria;
- Plantando e testando minas;
- Como fazer campo minado dinâmico/automático/aleatório;

**IDENTIFICANDO VEÍCULOS E TRIPULANTES**

- Como saber quando qualquer player obrigatoriamente de veículo passou na trigger;
- Como saber quando player específico obrigatoriamente de veículo passou na trigger;
- Como saber quando qualquer um (players ou bots) com veículo específico passou na trigger;
- Como saber quando player específico está dentro de qualquer veículo;

**LIDANDO COM GRUPOS**

- Consegue executar a ação somente o membro específico do grupo;
- Consegue executar a ação somente o líder do grupo específico;
- Consegue executar a ação qualquer membro do grupo específico;
- Consegue executar a ação qualquer membro de qualquer grupo da fação específica;
- Consegue executar a ação se o grupo específico se aproximar do alvo ainda vivo;

dentre muitas outras coisas ainda não listadas acima...

## Instalação / Como usar este framework

1) Aqui no Github, clique em "Code" e depois em "Download ZIP";
2) Descompacte o ZIP na sua pasta de missões editáveis: C:\Users\<você>\Documents\Arma 3 - Other Profiles\<você>\missions\
3) Carregue seu Arma 3 com as dependências (mods) necessárias (CBA + ACE);
4) Dentro do Arma 3, acesse o Eden Editor, selecione o mapa "Virtual Reality" e lá estará a missão "Para novos editores".

## Changelog

- 2022-01-27 - Redistribuição dos exemplos no mapa para facilitar compreensão dos temas, assim como novos exemplos.
- 2021-05-05 - Algumas melhorias e novas adições de exemplos práticos.
- 2020-12-28 - Adicionado novos exemplos, principalmente os relacionados a probabilidade de objetos e unidades spawnarem.
- 2020-07-15 - Inúmeras melhorias e novas ideias como players iniciando partida já com a nightvision acionada e spawns de veículos.
- 2020-06-29 - Melhorias menores como deixar a missão sem binarização para facilitar a auditoria dos edições no mission.sqm.
