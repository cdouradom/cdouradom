#language: pt

Funcionalidade: Banking - Exibição de Banners
 Como usuário participante desta campanha
 Quero visualizar os banners na versão desktop e mobile, conforme meu perfil
 Para acompanhar as artes, os comunicados e promoções da campanha

-----

Critérios de Aceitação:
 Ver em desktop somente banner deste tipo
 Ver em mobile somente banner deste tipo quando cadastrado
 Não visualizar banner que teve data final vencida
 Não visualizar banner que ainda não atingiu sua data de início
 Banner deve ter transição de carrossel
 Não visualizar banner excluídos
 Visualizar banner cadastrados instantaneamente

 ---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Banner desktop
        Dado que o usuário está logado na plataforma banking da campanha via "desktop"
        Quando a home é carregada
        Então visualizo somente a(s) "Imagem banner Desktop" com transição de carrossel


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Banner mobile
        Dado que o usuário está logado na plataforma banking da campanha via "mobile"
        Quando a home é carregada
        Então visualizo somente a(s) "Imagem banner Mobile" com transição de carrossel


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Banner sem Datas definidas
        Dado que o usuário está logado na plataforma banking da campanha
        Quando existem banner sem datas definidas
        Então todos os banners que não possuem datas definidas são exibidos com transição de carrossel


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Banner fora da vigência
        Dado que o usuário está logado na plataforma banking da campanha
        Quando existem banner com "Data Inicial" futura
        Então esse banner desktop e mobile não serão mais exibidos no carrossel para os usuários
        Quando o banner possui "Data Final" do passado
        Então esse banner desktop e mobile não serão mais exibidos no carrossel para os usuários


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Banner Desktop/ Mobile com usuário segmentado
        Dado que o usuário está logado na plataforma banking da campanha via "mobile"
        Quando o banner está definido para um "Perfil", "Grupo", "Região" e "Segmento"
        E este usuário está dentro do público da segmentação deste banner
        Então este usuário verá o banner no carrossel de Banners


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Banner Desktop com Link
        Dado que o usuário está logado na plataforma banking da campanha
        E este banner possui um "Link" cadastrado
        Quando o usuário clicar na imagem do banner
        Então o link cadastrado deste banner será aberto para o usuário em nova aba do navegador


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Banner Mobile com Link
        Dado que o usuário está logado na plataforma banking da campanha via mobile
        E este banner possui um "Link" cadastrado
        Quando o usuário clicar na imagem do banner
        Então o link cadastrado deste banner será aberto para o usuário em nova aba do navegador


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Banner Excluído
        Dado que o usuário está logado na plataforma banking da Campanha
        E está visualizando um banner no carrossel
        Quando um admin excluir este banner via Plataforma
        E o usuário atualizar sua tela desktop e/ou mobile
        Então o banner excluído pelo admin não mais aparecerá para o usuário desktop e/ou mobile



#8 CN