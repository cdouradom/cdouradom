#language: pt

Funcionalidade: Treinamentos - Relatório de Treinamentos Realizados
 Como administrador da campanha
 Quero visualizar a listagem de treinamentos realizados
 Para conferir os treinamentos que os usuários do banking executaram
 
`account_subcampaign_training_participant`

-----

Critérios de Aceitação:
O Relatório de Treinamentos é incrementado a cada execução de treinamento feita pelo banking 

---


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Relatório de Treinamentos - Acesso e Layout
	Dado que o admin acessou o menu "Treinamentos"
	Quando acionar o submenu "Relatório de Treinamentos"
	Então o sistema redirecionará o admin para a tela "Relatório de Treinamentos"
	E os elementos abaixo serão exibidos

            | Breadcrumbs | Com o Caminho para essa tela                                                                 |
            | Título      | "RELATÓRIO DE TREINAMENTOS"                                                                  |
            | Filtros     | "Nome", "CPF/CNPJ", "Treinamento", "Data Inicial" e "Data Final"                             |
            | Botão       | "Buscar"                                                                                     |
            | Listagem    | conforme cabeçalho: Colunas Data, Usuário, Treinamento, Progresso, Média de Acertos e Pontos |
            | Listagem    | conforme rodapé: Texto informativo "Foram encontrados x resultados"                          |
            | Listagem    | conforme rodapé: Paginação                                                                   |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Relatório de Treinamentos - Filtros
	Dado que o admin esta na tela "Relatório de Treinamentos"
	Quando preencher os filtros "Nome", "CPF/CNPJ", "Treinamento", "Data Inicial" e "Data Final"
	E clicar em "Buscar"
	Então o sistema exibirá os seguintes resultados:
	Exemplos: 
            | <Nome>      | <CPF/CNPJ> | <Treinamento> | <Data Inicial>     | <Data Final>       | <Resultado>                                                                                                                       |
            | Existente   | Vazio      | Vazio         | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido na consulta e atualiza a informação do rodapé "Foram encontrados XX resultados." |
            | Inexistente | Vazio      | Vazio         | Vazio              | Vazio              | Nenhum resultado encontrado.                                                                                                      |
            | Inexistente | existente  | Da lista      | Válida e existente | Válida e existente | Nenhum resultado encontrado.                                                                                                      |
            | Vazio       | Vazio      | Vazio         | Vazio              | Vazio              | Retorna todos os treinamentos executados e atualiza a informação do rodapé "Foram encontrados XX resultados."                     |
            | Existente   | existente  | Vazio         | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido na consulta e atualiza a informação do rodapé "Foram encontrados XX resultados." |
            | Vazio       | existente  | Vazio         | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido na consulta e atualiza a informação do rodapé "Foram encontrados XX resultados." |
            | Vazio       | Vazio      | Da lista      | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido na consulta e atualiza a informação do rodapé "Foram encontrados XX resultados." |
            | Vazio       | Vazio      | Vazio         | Válida e existente | Vazio              | Retorna treinamentos que contém o valor inserido na consulta e atualiza a informação do rodapé "Foram encontrados XX resultados." |
            | Vazio       | Vazio      | Vazio         | Vazio              | Válida e existente | Retorna treinamentos que contém o valor inserido na consulta e atualiza a informação do rodapé "Foram encontrados XX resultados." |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Relatório de Treinamentos - Paginação
    Dado que o admin está na tela Relatório de Treinamentos
    Quando existem mais de 20 treinamentos executados
    Então o admin vizualizará no rodapé as páginas disponíveis
    E será possível realizar a transição entre as páginas


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Relatório de Treinamentos - Incrementação após execução pelo banking
    Dado que um usuário do banking acabou de executar um treinamento
    Quando o admin acessar o menu "Treinamento"
    E acessar o submenu "Relatório de Treinamentos"
    Então o admin vizualizará o treinamento que foi realizado pelo banking
    E este treinamento será o primeiro da lista
    E a listagem exibirá as seguintes informações relativas a execução do treinamento: "Data e Hora", "Usuário e CPF/CNPJ", "Nome e ID do treinamento", "Progresso", "Média de Acertos" e "Pontos"

@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Relatório de Treinamentos - Após banking cancelar a execução
    Dado que um usuário do banking acessou o primeiro módulo de um determinado Treinamento
    E sem executá-lo acionou o botão "Voltar"
    Quando o admin acessar o menu "Treinamento"
    E acessar o submenu "Relatório de Treinamentos"
    Então o admin não vizualizará o treinamento que foi acessado pelo usuário do banking

    
















