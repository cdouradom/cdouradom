#language: pt

Funcionalidade: Listagem da Biblioteca
Como administrador da campanha
 Quero acessar a listagem de bibliotecas
 Para visualizar as bibliotecas que estão cadastradas

library_item

-----

Critérios de Aceitação:

---

@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Listagem - Biblioteca - Acessar
    Dado que o admin esta logado
    Quando acessar o menu "Treinamentos"
    Então o submenu "Biblioteca" será exibido dentre as opções
    Quando o admin clicar no submenu "Biblioteca"
    Então o sistema redireciona para a tela "Biblioteca"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Listagem - Biblioteca - Layout
    Dado que o admin acessou o menu "Treinamentos"
    Quando acessar o submenu "Biblioteca"
    Então o sistema redireciona para a tela "Biblioteca"
    E os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                                                         |
            | Título      | "BIBLIOTECA"                                                                                         |
            | Filtros     | "Nome", "Tipo", "Treinamento" e "campanha                                                            |
            | Botão       | "Buscar"                                                                                             |
            | Listagem    | conforme cabeçalho: Colunas Nome, Tipo, Treinamento, Campanha, Home e botão "Ações" (Editar/Excluir) |
            | Listagem    | conforme rodapé: Texto informativo "Foram encontrados x resultados"                                  |
            | Listagem    | conforme rodapé: Paginação                                                                           |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Listagem - Biblioteca - Filtros
    Dado que o admin esta na tela de Treinamentos
    Quando informar um valor nos campos "Nome", "Tipo", "Treinamento" e "Campanha"
    E clicar em "Buscar"
    Então o sistema exibirá os seguintes resultados:
	Exemplos:
            | <Nome>      | <Tipo>   | <Treinamento> | <Campanha> | <Resultado>                                        |
            | Existente   | Vazio    | Vazio         | Vazio      | Retorna Bibliotecas que contenham o valor inserido |
            | Inexistente | Vazio    | Vazio         | Vazio      | Nenhum Resultado Encontrado                        |
            | Inexistente | Da Lista | Da lista      | Da lista   | Nenhum Resultado Encontrado                        |
            | Vazio       | Vazio    | Vazio         | Vazio      | Retorna todas as Bibliotecas                       |
            | Existente   | Vazio    | Vazio         | Vazio      | Retorna Bibliotecas que contenham o valor inserido |
            | Vazio       | Da Lista | Vazio         | Vazio      | Retorna Bibliotecas que contenham o valor inserido |
            | Vazio       | Vazio    | Da lista      | Vazio      | Retorna Bibliotecas que contenham o valor inserido |
            | Vazio       | Vazio    | Vazio         | Da lista   | Retorna Bibliotecas que contenham o valor inserido |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Listagem - Biblioteca - Ordenação na Home
    Dado que o admin esta na tela "Biblioteca"
    Quando acionar o botão "Ordenação na Home"
    Então o admin é redirecionado para a tela "Ordenação na Home"
    E no cabeçalho é demonstrada a informação "Este são os itens sendo atualmente exibidos na home (máximo de 6). Clique e arraste os itens para mudar a ordenação."
    Quando o admin clicar e arrastar as bibliotecas
    Então o sistema reposiciona a ordem da Biblioteca que foi arrastada


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Listagem - Biblioteca - Paginação
    Dado que o admin esta na tela "Biblioteca"
    Quando existem mais de 20 bibliotecas cadastrados
    Então o admin vizualizará no rodapé as páginas disponíveis
    E será possível realizar a transição entre as páginas    

