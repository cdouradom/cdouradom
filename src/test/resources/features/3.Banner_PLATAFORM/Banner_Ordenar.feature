#language: pt

Funcionalidade: Admin - Ordenar Banners
Como usuário administrador ativo na Plataforma
Quero acessar a tela de ordenação de Pop Ups
Para escolher a ordem de apresentação para o usuário final

---

Critérios de Aceitação:
Acesso através da listagem de Banners
Na página de ordenação - Exibir breadcrumb: "Gerencial / Listagem / Ordenação na Home"
Na página de ordenação - Exibir frase no cabeçalho "Estes são os banner sendo exibidos atualmente na home do banking. Clique e arraste os itens para mudar a ordenação."
Na página de ordenação - Listagem dos cards de Banners: exibir os últimos 9 mais recentes contendo em cada card as informações "Título" e "Imagem Desktop"
Na página de ordenação - Botão "Voltar" interrompe e não realiza a ordenação e redireciona para a listagem de Pop Ups
Na página de ordenação - Botão "Salvar" realiza a ordenação escolhida e redireciona para a listagem de Pop Ups


---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Ordenar - Acessar, validar Layout e Cancelar
        Dado que o admin esta na tela de "Listagem de Banners"
        Quando acionar o botão "Ordenação na Home"
        Então o sistema redireciona o admin para a tela de "Ordenação na Home"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o admin acionar o botão "Voltar"
        Então o sistema redireciona o admin de volta para a "Listagem de Banners"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Ordenar - Movimentar, Ordenar Card e Salvar 
        Dado que o admin está na página de "Ordenação na Home"
        Quando posicionar o cursor sobre o card 
        E pressionar com o botão esquerdo do mouse
        Então será possível arrastar o card para a ordem desejada
        Dado que a ordenação foi alterada
        Quando clicar no botão "Salvar"
        Então abrirá o modal com a mensagem "Ordem de banner salva com sucesso"
        E o sistema redireciona para a listagem de Pop Up
  
#2 CN