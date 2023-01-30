#language: pt

Funcionalidade: 


    'Tabelas do banco'

-----

Critérios de Aceitação:
Bibliotecas que possuem alguma segmentação (treinamento ou campanha) não estarão disponíveis para serem inseridas na home do banking
Apenas 6 itens da biblioteca podem ser configurados para aparecer na home do banking

---

@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Ordenação na Home - Acessar
    Dado que o admin esta logado
    Quando acessar o menu "Treinamentos"
    Então o submenu "Biblioteca" será exibido dentre as opções
    Quando o admin clicar no submenu "Biblioteca"
    Então o sistema redireciona para a tela "Biblioteca"
    Quando acionar o botão "Ordenação na Home"
    Então o admin será direcionado para a tela "Ordenação na Home"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Biblioteca - Ordenação na Home - Layout
    Dado que o admin está na tela "Biblioteca"
    Quando acionar o botão "Ordenação na Home"
    Então o admin será direcionado para a tela "Ordenação na Home"
    E os elementos abaixo serão exibidos
            | Breadcrumbs                | Caminho da tela                                                                                                                         |
            | Título                     | Ordenação na Home                                                                                                                       |
            | Cabeçalho                  | Texto informativo: Este são os itens sendo atualmente exibidos na home (máximo de 6). Clique e arraste os itens para mudar a ordenação. |
            | Região "Itens na Home"     | Quadro contendo as bibliotecas selecionadas para a exibição na Home do Banking                                                          |
            | Botões                     | "Voltar" e "Salvar"                                                                                                                     |
            | Listagem                   | Texto informativo: Estes são os itens disponíveis para serem adicionados à home. Clique em um item abaixo para adicioná-lo.             |
            | Região "Itens Disponíveis" | Quadro contendo as bibliotecas que não possuem segmentação, para serem selecionadas para compor o quadro da região "Itens na Home"      |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Ordenação na Home - Cadastrar - Cancelar
    Dado que o admin está na tela "Ordenação na Home"
    E na região "Itens na Home" há menos de 6 itens
    Quando clicar sobre os itens disponíveis na região "Itens Disponíveis"
    Então os itens serão inseridos na região "Itens na Home" 
    Quando o admin clicar no botão "Voltar"
    Então o admin será direcionado para a tela "Biblioteca"
    Quando acionar o botão "Ordenação na Home"
    Então os itens anteriormente selecionados não são mais demonstrados na região "Itens na Home"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Ordenação na Home - Cadastrar até 6 itens - Salvar
    Dado que o admin está na tela "Ordenação na Home"
    E na região "Itens na Home" há menos de 6 itens
    E na região "Itens Disponíveis" há somente bibliotecas sem nenhuma segmentação configurada (Usar em Treinamento/Usar em Campanha)
    Quando clicar sobre os itens disponíveis na região "Itens Disponíveis"
    Então os itens serão inseridos na região "Itens na Home" 
    E há no máximo 6 itens inseridos na região "Itens na Home"
    Quando o admin clicar no botão "Salvar"
    Então é exibido o modal "Ordem dos itens da biblioteca salva com sucesso!"
    E o admin será direcionado para a tela "Biblioteca"
    Quando acionar o botão "Ordenação na Home"
    Então os itens anteriormente selecionados serão demonstrados na região "Itens na Home"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Ordenação na Home - Cadastrar mais 6 itens - Salvar
    Dado que o admin está na tela "Ordenação na Home"
    E na região "Itens na Home" há 6 itens ou menos
    E na região "Itens Disponíveis" há somente bibliotecas sem nenhuma segmentação configurada (Usar em Treinamento/Usar em Campanha)
    Quando clicar sobre os itens disponíveis na região "Itens Disponíveis"
    Então os itens serão inseridos na região "Itens na Home" 
    E há mais de 6 itens inseridos na região "Itens na Home"
    Quando o admin clicar no botão "Salvar"
    Então é exibido o modal de atenção "Apenas seis itens da biblioteca podem ser apresentados na home."
    E ao fechar o modal o admin permanecerá na tela "Ordenação na Home"
    Quando o admin retirar itens da região "Itens"
    E a quantidade de itens da região "Itens na Home" for igual ou menor que 6
    Quando o admin acionar o botão "Salvar"
    Então é exibido o modal "Ordem dos itens da biblioteca salva com sucesso!"
    E o admin será direcionado para a tela "Biblioteca"
    Quando acionar o botão "Ordenação na Home"
    Então os itens anteriormente selecionados serão demonstrados na região "Itens na Home"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Ordenação na Home - Editar posições
    Dado que o admin está acessando a tela "Ordenação na Home"
    E há até 6 bibliotecas inseridas na região "Itens na Home"
    Quando o admin clicar sobre um ou mais itens de cada vez da região "Itens na Home"
    E arrastá-los sobre a posição de outros itens 
    Então o item arrastado tomará a posição do item que ocupava esta posição originalmente
    Quando o admin acionar o botão "Salvar"
    Então será exibido o modal "Ordem dos itens da biblioteca salva com sucesso!"
    Quando o usuário do banking acessar a Home 
    Então será disponilizado o item "Biblioteca" na Home do banking
    E a ordem das bibliotecas corresponderá à ordem que foi estabelecida pelo Admin na Plataforma


     






