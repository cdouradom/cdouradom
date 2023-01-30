#language: pt

Funcionalidade: Admin - Ordenar Pop Ups
Como usuário administrador ativo na Plataforma
Quero acessar a tela de ordenação de Pop Ups
Para escolher a ordem de apresentação para o usuário final

-----

Critérios de Aceitação:
Acesso através da listagem de Pop Ups
Na página de ordenação - Exibir breadcrumb: "Gerencial / Pop Up / Ordenar Pop Up"
Exibir o filtro: "Tela"
Listar no select "Tela": "Home", "Alterar Senha", "Biblioteca", "Campanhas", "Extrato de Pontos", "Meus Dados", "Meus Pedidos", "Notícias", "Notificações", "Regulamento", "Treinamentos" e botão "Buscar"
Na página de ordenação - Listagem dos cards de Pop Ups: exibir frase no cabeçalho "Estes são os Pop Up exibidos atualmente nesta tela, clique e arraste para mudar a ordem."
Na página de ordenação - Listagem dos cards de Pop Ups: exibir ícone (i) onde abrirá modal de alerta com a frase "Os pop-ups com a frequência sempre precisam ser o último na ordem de exibição da tela, pois após ele nenhum outro pop-up será exibido."
Na página de ordenação - Listagem dos cards de Pop Ups: exibir os últimos 20 mais recentes contendo em cada card as informações "Tela" , "Frequência", "ID do Pop Up" e "Título"
Na página de ordenação - Botão "Voltar" interrompe e não realiza a ordenação e redireciona para a listagem de Pop Ups
Na página de ordenação - Botão "Salvar" realiza a ordenação escolhida e redireciona para a listagem de Pop Ups

-----

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Ordenar - Acessar, validar Layout e Cancelar
        Dado que o admin esta na tela de "Listagem de Pop Ups"
        Quando acionar o botão "Ordenar Pop Up"
        Então o sistema redireciona o admin para a tela de "Ordenar Pop Up"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o admin acionar o botão "Voltar"
        Então o sistema redireciona o admin de volta para a "Listagem de Pop Ups"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Ordenar - Filtro Tela
        Dado que o admin está na página de "Ordenar Pop Up"
        Quando selecionar no filtro "Tela" uma das opções existentes no select: "Home", "Alterar Senha", "Biblioteca", "Campanhas", "Extrato de Pontos", "Meus Dados", "Meus Pedidos", "Notícias", "Notificações", "Regulamento" e "Treinamentos"
        E acionar o botão "Buscar"
        Então o sistema irá atualizar o resultado trazendo na listagem os cards referente a respectiva tela selecionada


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Ordenar - Movimentar, Ordenar Card e Salvar 
        Dado que o admin está na página de "Ordenar Pop Up"
        Quando posicionar o cursor sobre o card 
        E pressionar com o botão esquerdo do mouse
        Então será possível arrastar o card para a ordem desejada
        Dado que a ordenação foi alterada
        Quando clicar no botão "Salvar"
        Então abrirá o modal com a mensagem "Pop Up ordenado com sucesso"
        E o sistema redireciona para a listagem de Pop Up
  
#3 CN