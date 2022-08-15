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

**DETECTANDO VEÍCULOS E TRIPULANTES**

- Detectando qualquer um (player ou AI) com veículo específico na trigger;
- Detectando qualquer player obrigatoriamente de veículo na trigger;
- Detectando qualquer player com tipo de veículo específico na trigger;
- Detectando qualquer player com tipo e modelo de veículo especifico na trigger;
- Detectando player específico dentro de qualquer veículo na trigger;
- Detectando player específico obrigatoriamente de veículo na trigger; 
- Detectando grupo específico obrigatoriamente de veículo na trigger;

**AÇÃO AO SE APROXIMAR**

- Executa a ação ao se aproximar: somente um membro específico do grupo;
- Executa a ação ao se aproximar: somente o líder do grupo específico;
- Executa a ação ao se aproximar: qualquer membro do grupo específico (findIf);
- Executa a ação ao se aproximar: qualquer membro de dois ou mais grupos específicos (findIf);
- Executa a ação ao se aproximar: qualquer membro de qualquer grupo da facção específica (findIf);
- Executa a ação ao se aproximar: qualquer jogador humano de qualquer grupo da facção específica (findIf);
- Executa a ação ao se aproximar: qualquer membro de um grupo específico, desde que o objetivo ainda esteja vivo/não-destruído;
- Um grupo uni-se a outro grupo, formando um grupo único;

**VIVO OU MORTO, FUNCIONAL OU DESTRUÍDO**

- Detectando se alguém específico está vivo ou morto;
- Detectando se algo específico está funcional ou destruído;
- Verificando se grupo 1 ou grupo 2 foram mortos;
- Verificando se grupo 1 e grupo 2 foram mortos;
- Verificando se 50% do grupo específico foram mortos;

**REFÉM & PRISIONEIROS**

- Se rendendo via Eden;
- Se rendendo dinamicamente;
- Verificando dinamicamente se unidade está ou não rendida;
- Algemando in-game;
- Algemando via Eden;
- Algemando dinamicamente;
- Verificando dinamicamente se unidade está ou não algemada;
- Fazendo prisioneiro sem o uso de algemas (Captive);
- Resgatando refém (joinSilent);
- Resgatando alguém e lhe dando armas e munição;

**HELICÓPTEROS**

- Detectando decolagem;
- Deletando tripulação após o pouso;
- Pegando e deixando carga/veículo (Cargo);
- Iniciando missão em pleno voo e com carga rebocada (Cargo);
- AI pousando com precisão;

**COMUNICAÇÃO**

- Comunicação por texto: HINT (para todo mundo);
- Comunicação por texto: HINT (para Facção específica);
- Comunicação por texto: HINT (para Grupo específico);
- Comunicação por texto: HINT (para Player específico);
- Comunicação por texto: systemChat (para todo mundo);
- Comunicação por texto: systemChat (para Grupo específico);
- Comunicação por texto: systemChat (para Player específico);
- Comunicação por texto: sideChat (Base da facção específica falando);
- Comunicação por texto: sideChat (Líder do grupo específico falando);
- Comunicação por texto: sideChat (Alguém específico falando);
- Comunicação por texto: commandChat (Base da facção específica falando);
- Comunicação por texto: commandChat (Líder do grupo específico falando);
- Comunicação por texto: commandChat (Alguém NÃO-líder falando);
- Comunicação por texto: groupChat (Líder do grupo falando);
- Comunicação por texto: groupChat (Alguém específico do grupo falando);
- Comunicação por texto: vehicleChat (para veículo de Alguém específico);
- Comunicação por texto: vehicleChat (para veículo do Líder do grupo específico);
- Comunicação por texto: customChat;
- Comunicação por texto: globalChat;

dentre muitas outras coisas ainda não listadas acima...

## Instalação / Como usar este framework

1) Aqui no Github, clique em "Code" e depois em "Download ZIP";
2) No arquivo ZIP, descompacte a pasta "para-novos-editores.VR" dentro da sua pasta de missões editáveis: C:\Users\<você>\Documents\Arma 3 - Other Profiles\<você>\missions\
3) Carregue seu Arma 3 com as dependências (mods) necessárias (CBA + ACE);
4) Dentro do Arma 3, acesse o Eden Editor, selecione o mapa "Virtual Reality" e lá estará a missão "Para novos editores".

## Changelog

- 2022-08-12 - Atualizado o método "deleteVehicleCrew" para o formato mais novo e simplificado; Adicionado método mais eficiente de detectar grupos dentro de uma trigger; AI T8 script atualizado com a função que remove items (night visions, por exemplo) das unidades spawnadas dinamicamente, se o editor quiser.
- 2022-07-18 - Adicionado exemplos de nearestObjects; Alguns exemplos foram melhorados; Algumas correções.
- 2022-01-27 - Redistribuição dos exemplos no mapa para facilitar compreensão dos temas, assim como novos exemplos.
- 2021-05-05 - Algumas melhorias e novas adições de exemplos práticos.
- 2020-12-28 - Adicionado novos exemplos, principalmente os relacionados a probabilidade de objetos e unidades spawnarem.
- 2020-07-15 - Inúmeras melhorias e novas ideias como players iniciando partida já com a nightvision acionada e spawns de veículos.
- 2020-06-29 - Melhorias menores como deixar a missão sem binarização para facilitar a auditoria dos edições no mission.sqm.
