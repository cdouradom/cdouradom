#language: pt

Funcionalidade: Treinamentos - Listagem e Filtros
 Como administrador da campanha
 Quero visualizar a listagem de treinamentos
 Para conferir os treinamentos que estão cadastrados

-----

Critérios de Aceitação:
Cada treinamento é composto por pelo menos um nome, imagem, status e um módulo
Cada treinamento precisa ter pelo menos um módulo configurado

---
@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Acessar
    Dado que o admin esta logado
    Quando acessar o menu "Treinamentos"
    Então o submenu "Listagem" será exibido dentre as opções
    Quando o admin clicar no submenu "Listagem"
    Então o sistema redireciona para a tela da listagem de "Treinamentos"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Layout
    Dado que o admin acessou o menu "Treinamentos"
    Quando o sistema redirecionar o admin para a tela dos Treinamentos
    Então os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                                                                       |
            | Botões      | "Ordenação na Listagem", "Ordenação na Home" e "Cadastrar"                                                         |
            | Título      | "TREINAMENTOS"                                                                                                     |
            | Filtros     | "Nome", "Status" (Ativo/Inativo)                                                                                   |
            | Botão       | "Buscar"                                                                                                           |
            | Listagem    | conforme cabeçalho: Thumbs dos treinamentos em ordem descrescente por ID, com imagem, nome, status e botão "Ações" |
            | Listagem    | conforme rodapé: Texto informativo "Foram encontrados x resultados"                                                |
            | Listagem    | conforme rodapé: Paginação                                                                                         |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Filtro - Busca por nome do treinamento válido/existente
    Dado que o admin esta na tela de Treinamentos
    Quando preencher um valor existente para essa campanha no filtro "Nome"
    E clicar em "Buscar"
    Então o sistema exibirá apenas as thumbs respectivas aos treinamentos com esse nome
    E seja pelo nome total e/ou parcial, pois a busca é por "like"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Filtro - Busca por nome do treinamento inválido/inexistente
    Dado que o admin esta na tela de Treinamentos
    Quando preencher um valor inexistente para essa campanha no filtro "Nome"
    E clicar em "Buscar"
    Então o sistema vai sinalizar com a mensagem "Nenhum resultado encontrado."
    E não exibirá nenhuma thumb, pois não existem resultados


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Filtro - Busca por nome e status 
    Dado que o admin esta na tela de Treinamentos
    Quando digitar um valor no campo "Nome"
    E selecionar uma opção da lista no filtro "<status>"
    E clicar em "Buscar"
    Então o sistema exibe um "<Resultado>" para cada busca realizada
    Exemplos:
            | Nome        | Status  | Resultado                                             |
            | Vazio       | Vazio   | Todos os treinamentos                                 |
            | Existente   | Vazio   | Treinamentos com o nome pesquisado (%like)            |
            | Inexistente | Vazio   | Vazio                                                 |
            | Existente   | Ativo   | Treinamentos com o nome pesquisado (%like) e Ativos   |
            | Existente   | Inativo | Treinamentos com o nome pesquisado (%like) e Inativos |
            | Inexistente | Ativo   | Vazio                                                 |
            | Inexistente | Inativo | Vazio                                                 |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Ordenação na Listagem 
    Dado que o admin esta na tela de Treinamentos
    Quando acionar o botão "Ordenação na listagem"
    Então o admin é redirecionado para a tela "Ordenação na Listagem"
    E no cabeçalho é demonstrada a informação "Clique e arraste os itens para mudar a odem na qual esses treinamentos aparecem para os usuários."
    Quando o admin clicar e arrastar os treinamentos
    Então o sistema reposiciona a ordem do treinamento que foi arrastado 


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Ordenação na Home 
    Dado que o admin esta na tela de Treinamentos
    Quando acionar o botão "Ordenação na Home"
    Então o admin é redirecionado para a tela "Ordenação na Home"
    E no cabeçalho é demonstrada a informação "Este são os treinamentos sendo atualmente exibidos na home (máximo de 6). Clique e arraste os treinamentos para mudar a ordenação."
    Quando o admin clicar e arrastar os treinamentos
    Então o sistema reposiciona a ordem do treinamento que foi arrastado 


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Paginação
    Dado que o admin esta na tela de Treinamentos
    Quando existem mais de 20 treinamentos cadastrados
    Então o admin vizualizará no rodapé as páginas disponíveis
    E será possível realizar a transição entre as páginas
    