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
@Tarefa_#:#59188
@Ajuste_61041
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_desktop_visualização.mp4)
    Cenário: Home Banking - Banner desktop
        Dado que o usuário está logado na plataforma banking da campanha via "desktop"
        Quando a home é carregada
        Então visualizo somente a(s) "Imagem banner Desktop" com transição de carrossel

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Bannner_mobile_visualizacao.mp4)
    Cenário: Home Banking - Banner mobile
        Dado que o usuário está logado na plataforma banking da campanha via "mobile"
        Quando a home é carregada
        Então visualizo somente a(s) "Imagem banner Mobile" com transição de carrossel

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_sem_data_de_divulgação.mp4)
    Cenário: Home Banking - Banner sem Datas definidas
        Dado que o usuário está logado na plataforma banking da campanha
        Quando existem banner sem datas definidas
        Então todos os banners que não possuem datas definidas são exibidos com transição de carrossel

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_fora_da_vigencia.mp4)
    Cenário: Home Banking - Banner fora da vigência
        Dado que o usuário está logado na plataforma banking da campanha
        Quando existem banner com "Data Inicial" futura
        E banner com "Data Final" passada
        Então esses banners desktop e mobile não serão mais exibidos no carrossel para os usuários

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_peso_grupo_visualização.mp4)
    Cenário: Home Banking - Banner Desktop para Revenda do usuário
        Dado que o usuário está logado na plataforma banking da campanha
        Quando o banner está definido para um "Grupo", "Rede" e/ou "Regional"
        E este usuário está dentro do público algo da segmentação deste banner, através do vínculo da "Revenda"
        Então este usuário verá o banner no carrossel de Banners

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_grupo_igual_do_user_logado_mobile.mp4)
    Cenário: Home Banking - Banner Mobile para Revenda do usuário
        Dado que o usuário está logado na plataforma banking da campanha via "mobile"
        Quando o banner está definido para um "Grupo", "Rede" e/ou "Regional"
        E este usuário está dentro do público algo da segmentação deste banner, através do vínculo do "Revenda"
        Então este usuário verá o banner no carrossel de Banners


@manual
@Tarefa_#:#59188
@Ajuste_#61087
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_segmentação.mp4)
    Cenário: Home Banking - Banner para Revenda diferente do usuário
        Dado que o usuário está logado na plataforma banking da campanha
        Quando o banner está definido para um "Grupo" e/ou "Rede" e/ou "Revenda"
        Mas este usuário não é do público algo da segmentação deste banner, pois seu vínculo é com outra "Revenda"
        Então este usuário não verá o banner no carrossel de Banners, desktop e mobile


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_peso_grupo_visualização.mp4)
    Cenário: Home Banking - Banner com Peso
        Dado que foi configurado pelo admin o peso de cada Banner
        Quando o usuário acessar a home do banking
        Então os banners serão exibidos conforme o maior peso definido


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_link_visualização_desk.mp4)
    Cenário: Home Banking - Banner Desktop com Link
        Dado que o usuário está logado na plataforma banking da campanha
        E este banner possui um "Link" cadastrado
        Quando o usuário clicar na imagem do banner
        Então o link cadastrado deste banner será aberto para o usuário em nova aba do navegador


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_link_visualização_mobile.mp4)
    Cenário: Home Banking - Banner Mobile com Link
        Dado que o usuário está logado na plataforma banking da campanha via mobile
        E este banner possui um "Link" cadastrado
        Quando o usuário clicar na imagem do banner
        Então o link cadastrado deste banner será aberto para o usuário em nova aba do navegador


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_Banner_excluir_visão_desk.mp4)
    Cenário: Home Banking - Banner Excluído
        Dado que o usuário está logado na plataforma banking da Campanha
        E está visualizando um banner no carrossel
        Quando um admin excluir este banner via Plataforma
        E o usuário atualizar sua tela desktop e/ou mobile
        Então o banner excluído pelo admin não mais aparecerá para o usuário desktop e/ou mobile

#11 CN