#language: pt

Funcionalidade: Banking - Notícias
 Como usuário participante desta campanha
 Quero visualizar as notícias na plataforma banking, conforme meu perfil
 Para acompanhar os comunicados e informativos da campanha


Critérios de Aceitação:
 Ver até 3 notícias na Home, uma maior e duas menores empilhadas ao lado #ou 5 com duas ao lado e 3 abaixo da maior
 Não visualizar notícias que ainda não atingiram sua Data de Divulgação
 Visualizar primeiro as notícias de maior peso e depois pelo ID mais recente
 Visualizar somente as notícias definidas para Revendas vinculadas do usuário logado
 Visualizar somente as notícias definidas para o Cargo do usuário logado
 Demonstrar um botão "Mais Notícias" abaixo das Notícias na Home
 Não visualizar notícias excluídas
 Visualizar notícias cadastrados instantaneamente quando a Data de Divulgação é igual ou menor que a atual
 Visualizar a data do cadastro da Notícia na thumb
 Visualizar a thum com a imagem definida no cadastro da Notícia ou uma imagem/fundo padrão quando não cadastrada uma imagem na Notícia
 Visualizar parte da descrição na thumb abaixo do título da Notícia, conforme limite de caracteres
 Visualizar todo o Título, conforme limite de caracteres
 Uma notícia com link, abre a url definido em nova aba do navegador com clique na thumb
 
 
 ---

Contexto: 
    Dado que o usuário está logado na plataforma banking da campanha


@manual
@Tarefa_#:#59198
@Ajuste_#61032
@Sugestão_#61037
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência_1](assets/B_News_layout.png),[Evidência_2](assets/B_News_layout_cor.png)
    Cenário: Home - Layout e Thumb
        Quando o usuário visualizar a área destinada às "Notícias" na home
        E cada "Notícia" terá sua "Thumb" contendo: "Imagem"; "Título"; "Descrição"; "Data de Cadastro" em formato DD/MM/AAAA
        E com um botão "Mais Notícias" logo abaixo
        Então os elementos da tela estão alinhados corretamente

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_News_ver_todas_news.mp4)
    Cenário: Home - Disposição e Limite das Thumbs na Home e clique no botão Mais Notícias
        Quando existe somente uma Notícia cadastrada, vigente e disponibilizada para o usuário
        Então terá somente uma thumb grande na home
        Quando existem somente duas Notícias cadastradas, vigentes e disponibilizadas para o usuário
        Então terá uma thumb grande
        E outra thumb menor ao lado da grande, mas ocupando somente metade da altura da thumb grande, com espaço para a terceira thumb
        Quando existem três Notícias cadastradas, vigentes e disponibilizadas para o usuário
        Então terá uma thumb grande
        E duas thumbs menores ao lado empilhadas
        Quando existem mais que três Notícias cadastradas, vigentes e disponibilizadas para o usuário
        Então na Home são exibidas as três com maior peso e/ou ID mais recente
        E as demais são exibidas na tela da Listagem de Notícias
        Quando o usuário acionar o botão "Mais Notícias"
        Então o sistema redirecionao usuário para a listagem de Notícias


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_News_visualização_peso.mp4)
    Cenário: Ordenação pelo Peso 
        Quando existem duas ou mais notícias com diferentes pesos cadastrados
        Então elas serão exibidas conforme maior peso cadastrado tanto na "Home" como na "Listagem de Notícias"


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_News_visualização_peso.mp4)
    Cenário: Ordenação pelo Peso e ID mais recente
        Quando existem duas ou mais notícias com o mesmo peso cadastrado
        Então elas serão exibidas conforme maior peso 
        E conforme ID mais recente cadastrado tanto na "Home" como na "Listagem de Notícias"
#nesse video tem news com o msm peso e com isso ele organiza pelo ID

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência_1](assets/B_News_thumb.png),[Evidência_2](assets/B_News_thumb_home.png)
    Cenário: Validar imagem na thumb
        Quando a "Notícia" não possui uma imagem cadastrada pelo admin
        Então a "thumb" da Notícia é exibida com uma imagem padrão da campanha ou um fundo neutro, "Título"; "Descrição"; "Data de Cadastro" em formato DD/MM/AAAA, tanto na "Home" como na "Listagem de Notícias"
        Quando a "Notícia" possui uma imagem cadastrada pelo admin
        Então a "thumb" da Notícia é exibida com a imagem anexada em seu cadastro, "Título"; "Descrição"; "Data de Cadastro" em formato DD/MM/AAAA, tanto na "Home" como na "Listagem de Notícias"


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_sem_descrição.mp4)
    Cenário: Sem Descrição
        Quando a "Notícia" não possui uma Descriçao cadastrada pelo admin
        Então a "Thumb" da Notícia é exibida contendo: "Imagem"; "Título" e "Data de Cadastro" em formato DD/MM/AAA, tanto na "Home" como na "Listagem de Notícias"


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_data_alterada.mp4)
Cenário: Data de Publicação
    Quando a "Notícia" possui uma "Data de Divulgação" maior que a data atual, como 01/12/2022
    Então a "thumb" da Notícia não é exibida no Banking, tanto na "Home" como na "Listagem de Notícias"
    Quando a "Notícia" possui uma "Data de Divulgação" igual ou menor que a data atual
    Então a "thumb" da Notícia é exibida no Banking normalmente, tanto na "Home" como na "Listagem de Notícias"


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_sem_segmentação.mp4)
    Cenário: Sem segmentação definida
        Quando a "Notícia" foi cadastrada sem nenhuma segmentação definida
        Então a "thumb" da Notícia é exibida normalmente para todos os usuários tanto na "Home do Banking" como na "Listagem de Notícias"
        E todos os usuários conseguem acessar os detalhes da Notícia normalmente, clicando na "Thumb"

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_com_link_redirecionamento.mp4)
    Cenário: Com link cadastrado
        Quando a "Notícia" foi cadastrada com link para Redirecionamento
        E o usuário clicar na thumb desta
        Então o sistema abre o link definido na notícia em uma nova aba do navegador


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_menu_lateral.png)
    Cenário: Listagem - Acessar através do Menu
        E o usuário aciona o Menu Principal Superior
        Quando acionar o submenu "Notícias"
        Então o sistema redireciona o usuário para a listagem de Notícias


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_acesso_pelo_menu.mp4)
    Cenário: Listagem - Layout
        E o usuário acionou o botão "Mais Notícias" ou acionou o submenu dentro do menu principal superior "Notícias"
        Quando visualizar os elementos desta tela com todas as notícias exibidas em suas respectivas thumb com "Imagem", "Título", "Descrição", "Data do cadastro"
        E ordenadas pelo maior peso e/ou ID mais recente
        Então os elementos da tela estão alinhados corretamente


@manual
@Tarefa_#:#59198
@Ajuste_#61036
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/B_News_segmentação_grupo.mp4)
    Cenário: Com segmentação por Grupo
        Quando a "Notícia" foi cadastrada com segmentação por "Grupo"
        E o usuário logado possui vínculo com a Revenda que é vinculada ao mesmo Grupo definido na segmentação
        Então a "thumb" da Notícia é exibida normalmente para este usuário na "Home do Banking" e na "Listagem de Notícias"
        E o usuário consegue acessar os detalhes da Notícia normalmente
        Mas para o usuário vinculado à Revenda de Grupo que não esteja na segmentação desta notícia
        Então este usuário não visualizará


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/B_News_segmentação_rede.mp4)
    Cenário: Com segmentação por Rede
        Quando a "Notícia" foi cadastrada com segmentação por "Rede"
        E o usuário logado possui vínculo com a Revenda que é vinculada a mesma Rede definida na segmentação
        Então a "thumb" da Notícia é exibida normalmente para este usuário na "Home do Banking" e na "Listagem de Notícias"
        E o usuário consegue acessar os detalhes da Notícia normalmente
        Mas para o usuário vinculado à Revenda de Rede que não esteja na segmentação desta notícia
        Então este usuário não visualizará

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/B_News_segmentação_rede_grupo.mp4)
    Cenário: Com segmentação por Grupo e Rede
        Quando a "Notícia" foi cadastrada com segmentação por "Grupo" e por "Rede"
        E o usuário logado possui vínculo com a Revenda que é vinculada ao mesmo Grupo e Rede definidos na segmentação
        Então a "thumb" da Notícia é exibida normalmente para este usuário na "Home do Banking" e na "Listagem de Notícias"
        E o usuário consegue acessar os detalhes da Notícia normalmente
        Mas para o usuário vinculado à Revenda de Grupo e Rede que não estejam na segmentação desta notícia
        Então este usuário não visualizará

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/B_News_rede_grupo_cargo.mp4)
    Cenário: Com segmentação por Grupo, Rede e Cargo
        Quando a "Notícia" foi cadastrada com segmentação por "Grupo", "Rede" e "Cargo"
        E o usuário logado possui vínculo com a Revenda definida na segmentação
        Então a "thumb" da Notícia é exibida normalmente para este usuário na "Home do Banking" e na "Listagem de Notícias"
        E o usuário consegue acessar os detalhes da Notícia normalmente
        Mas para o usuário vinculado à Revenda de Grupo e Rede que não estejam na segmentação desta notícia, e/ou que seja de outro cargo
        Então este usuário não visualizará  


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/B_News_cargo_grupo.mp4)
    Cenário: Com segmentação por Grupo e Cargo
        Quando a "Notícia" foi cadastrada com segmentação por "Grupo" e por "Revenda"
        E o usuário logado possui vínculo com a Revenda definida na segmentação
        Então a "thumb" da Notícia é exibida normalmente para este usuário na "Home do Banking" e na "Listagem de Notícias"
        E o usuário consegue acessar os detalhes da Notícia normalmente 
        Mas para o usuário vinculado à Revenda de Grupo que não esteja na segmentação desta notícia, e/ou que seja de outro cargo
        Então este usuário não visualizará      

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/B_News_rede_cargo.mp4)
    Cenário: Com segmentação por Rede e Cargo
        Quando a "Notícia" foi cadastrada com segmentação por "Rede" e por "Cargo"
        E o usuário logado possui vínculo com a Revenda definida na segmentação
        Então a "thumb" da Notícia é exibida normalmente para este usuário na "Home do Banking" e na "Listagem de Notícias"
        E o usuário consegue acessar os detalhes da Notícia normalmente
        Mas para o usuário vinculado à Revenda de Rede que não esteja na segmentação desta notícia, e/ou que seja de outro cargo
        Então este usuário não visualizará   

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_sem_link_redirecionamento.mp4)
    Cenário: Com link cadastrado
        Quando a "Notícia" foi cadastrada com o campo "Habilitar Redirecionamento" igual a "Sim", possuindo um "Link" para "Redirecionamento"
        E o usuário clicar na "thumb" disponível do banking tanto na "Home do Banking" como na "Listagem de Notícias"
        Então o sistema abre o link definido na notícia em uma nova aba do navegador, mesmo que essa Noticia possua Conteúdo cadastrado

#18 CN