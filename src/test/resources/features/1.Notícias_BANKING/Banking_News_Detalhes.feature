#language: pt

Funcionalidade: Banking - Detalhes de Notícias
 Como usuário participante e ativo desta campanha
 Quero visualizar e abrir as notícias na versão desktop e mobile, conforme meu perfil e meu vínculo
 Para acompanhar os comunicados, promoções, assistir vídeos e ler as novidades da campanha

-----

Critérios de Aceitação:
 Visualizar todas as informações das notícias tanto no desktop como no mobiel (resposivo)
 Aplicar segmentação definida e não abrir notícia para usuário fora do público alvo, mesmo inserindo o ID via url
 Exibir no topo da tela o Título, seguido da imagem, do conteúdo e por fim do vídeo se houver
 Disponibilizar botão "Voltar" ao final da notícia
 Botão "Voltar" direciona para a listagem de todas as notícias

---

Contexto: 
    Dado que o usuário está logado na plataforma banking da campanha

@manual
@Tarefa_#:#59198
@Ajuste_#61033
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_detalhes_noticia.mp4)
    Cenário: Detalhes - Validar Conteúdo com formatação de texto, imagem e vídeo, +botão Voltar
        Quando acionada a "Thumb" de uma notícia, seja através da "Home do Banking" ou da "Listagem de Notícias"
        E essa notícia não possuir link de Redirecionamento
        Então o sistema exibe os "Detalhes" da respectiva notícia
        E exibe o título, a imagem, o ID na url
        E exibe todo a descrição do conteúdo seja formatado, colorido ou não
        E exibe a(s) imagem(ns) inseridas na descrição do conteúdo
        E exibe o vídeo cadastrado logo abaixo da "Descrição Curta"
        E ao final da tela teremos um Botão "Voltar"
        Quando acionar o botão "Voltar"
        Então o sistema redireciona o usuário para a tela da "Listagem de Notícias"


@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/B_News_video.mp4)
    Cenário: Detalhes - Play em vídeo
        E o usuário abre uma notícia que possui vídeo
        Quando o usuário der 'play' no vídeo
        Então o vídeo será iniado/exibido conforme plugin do youtube


@manual
@Tarefa_#:#59198
@Ajuste_#61501
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/B_News_sem_acesso.mp4)
    Cenário: Acessar via URL o ID de Notícia segmentada
        E abriu os detalhes de uma Notícia desta campanha, seja através da "Home do Banking" ou da "Listagem de Notícias"
        Quando alterar o ID via url para o ID de uma Notíca segmentada para Revendas diferentes do vínculo do usuário logado
        E der "enter"
        Então o sistema bloqueia, retornando o usuário para a home, ou para a listagem de notícias, ou algo similar
        Mas não exibe a Notícia com segmentação diferente do vinculo que o usuário logado possui

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/B_News_id_outra_campanha.mp4)
    Cenário: Acessar URL de Notícia de outra campanha via ID
        Quando abrir os detalhes de uma Notícia desta campanha, seja através da "Home do Banking" ou da "Listagem de Notícias"
        E alterar o ID da url para o ID da Notíca de outra campanha
        E der "enter"
        Então o sistema bloqueia, retornando o usuário para a home, ou para a listagem de notícias, ou algo similar 
        Mas não exibe os dados da Notíca de outra campanha

@manual
@Tarefa_#:#59198
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência_1](assets/B_News_remover_cargo.mp4),[Evidência_2](assets/B_News_rede_para_não_ter_acesso.mp4)
    Cenário: Editando a segmentação da Noticia para remover da visão do usuário
        E o usuário logado visualiza a "Notícia" de 'ID x' conforme vínculo com sua Revenda
        Mas o admim alterar a segmentação para "Grupo", "Rede" diferente do vínculo do usuário logado ou "Cargo" diferente do seu
        Quando o usuário atualizar sua página do banking 
        Então a "thumb" da Notícia não mais será exibida tanto na "Home do Banking" como na "Listagem de Notícias", devido a mudança da segmentação da Notícia
        E ao usuário tentar acessar via url com o ID da Notícia, o sistema irá redicionar de volta para a Home ou para a tela de Notícias

#5 CN