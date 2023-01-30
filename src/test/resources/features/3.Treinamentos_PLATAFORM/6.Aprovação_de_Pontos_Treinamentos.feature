#language: pt

Funcionalidade: Treinamentos - Aprovação de Pontos
 Como administrador da campanha
 Quero aprovar os pontos dos treinamentos que pontuaram
 Para atribuir a pontuação correta aos usuários

point_statement

-----

Critérios de Aceitação:
Somente serão apresentados os treinamentos que foram executados pelo banking e que geraram pontuação
Somente serão apresentados os treinamentos que receberam pontuação na primeira execução
Os treinamentos deixarão de ser demonstrados nesta tela assim que o Admin aprovar os pontos
O percentual de desempenho demonstrado no relatório deverá corresponder à divisão da quantidade de acertos pela quantidade total de perguntas do quiz


---

@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Aprovação de Pontos - Acesso e Layout
	Dado que o admin acessou o menu "Treinamentos"
	Quando acionar o submenu "Aprovação de Pontos"
	Então o sistema redirecionará o admin para a tela "Aprovação de Pontos"
	E os elementos abaixo serão exibidos

            | Breadcrumbs | Com o Caminho para essa tela                                                           |
            | Título      | "RELATÓRIO DE TREINAMENTOS"                                                            |
            | Botão       | "Ver Histórico de Aprovação"                                                           |
            | Filtros     | "Nome", "CPF/CNPJ", "Data Inicial", "Data Final", "Treinamento", "Quiz"                |
            | Botão       | "Buscar"                                                                               |
            | Listagem    | conforme cabeçalho: Colunas Data, Usuário, Quiz, Desempenho e Ações (Aprovar/Reprovar) |
            | Listagem    | conforme rodapé: Texto informativo "Foram encontrados x resultados"                    |
            | Listagem    | conforme rodapé: Paginação                                                             |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Aprovação de Pontos - Filtros
	Dado que o admin esta na tela "Aprovação de Pontos"
	Quando preencher os filtros "Nome", "CPF/CNPJ", "Data Inicial", "Data Final", "Treinamento" e "Quiz" 
	E clicar em "Buscar"
	Então o sistema exibirá os seguintes resultados:
	Exemplos: 
            | <Nome>      | <CPF/CNPJ> | <Data Inicial> | <Data Final>       | <Treinamento>      | <Quiz>   | <Resultado>                                                      |
            | Existente   | Vazio      | Vazio          | Vazio              | Vazio              | Vazio    | Retorna treinamentos que contenham como usuário o valor inserido |
            | Inexistente | Vazio      | Vazio          | Vazio              | Vazio              | Vazio    | Nenhum resultado encontrado.                                     |
            | Inexistente | existente  | Da lista       | Válida e existente | Válida e existente | Da lista | Nenhum resultado encontrado.                                     |
            | Vazio       | Vazio      | Vazio          | Vazio              | Vazio              | Vazio    | Retorna todos os treinamentos executados                         |
            | Existente   | existente  | Vazio          | Vazio              | Vazio              | Vazio    | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | existente  | Vazio          | Vazio              | Vazio              | Vazio    | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Da lista       | Vazio              | Vazio              | Vazio    | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio          | Válida e existente | Vazio              | Vazio    | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio          | Vazio              | Válida e existente | Vazio    | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio          | Vazio              | Vazio              | Da lista | Retorna treinamentos que contém o valor inserido                 |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Aprovação de Pontos - Paginação
    Dado que o admin esta na tela "Aprovação de Pontos"
    Quando existem mais de 20 registros
    Então o admin vizualizará no rodapé as páginas disponíveis
    E será possível realizar a transição entre as páginas


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Aprovação de Pontos - Incrementação após pontuar na primeira execução pelo banking
    Dado que um usuário do banking acabou de pontuar na primeira execução de um determinado treinamento
    Quando o admin acessar o menu "Treinamento"
    E acessar o submenu "Aprovação de Pontos"
    Então o admin vizualizará o treinamento e os quizzes que foram Realizados pelo banking
    E a listagem exibirá as seguintes informações: "Data e Hora", "Usuário e CPF/CNPJ", "Nome do quiz e do treinamento", "Percentual de desempenho e Pontos"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Aprovação de Pontos - Sem pontuar na primeira execução pelo banking
    Dado que um usuário do banking acabou de realizar a primeira execução de um determinado treinamento
    E não atingiu a quantidade de acertos necessária para pontuar
    Quando o admin acessar o menu "Treinamento"
    E acessar o submenu "Aprovação de Pontos"
    Então a execução do treinamento não será demonstrada no relatório


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Aprovação de Pontos - Sem pontuar na segunda execução pelo banking
    Dado que um usuário do banking acabou de pontuar na primeira execução de um determinado treinamento
    Quando o admin acessar o menu "Treinamento"
    E acessar o submenu "Aprovação de Pontos"
    Então o admin vizualizará o treinamento e os quizzes que foram Realizados pelo banking
    E a listagem exibirá as seguintes informações: "Data e Hora", "Usuário e CPF/CNPJ", "Nome do quiz e do treinamento", "Percentual de desempenho e Pontos"
    Quando o usuário do banking executar novamente o mesmo treinamento 
    E o admin acessar o menu "Treinamento"
    E acessar o submenu "Aprovação de Pontos"
    Então somente a primeira execução deste treinamento é demonstrada no relatório


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Aprovação de Pontos - Aprovar e Cancelar
    Dado que o admin acessou o menu "Treinamento"
    E acessou o submenu "Aprovação de Pontos"
    E na listagem existem execuções a serem "Aprovadas" ou "Reprovadas"
    Quando o admin acionar o botão "Ações" de uma determinada execução da lista
    E acionar a opção "Aprovar"
    Então será exibido o modal "Confirmar Pontuação" com o texto "Deseja aprovar (x pontos) para (Usuário)?" e os botões "Cancelar" e "Aprovar"
    Quando o admin acionar a opção "Cancelar"
    Então o modal será fechado e o admin será direcionado para a tela "Aprovação de Pontos"
    E o registro da execução continuará sendo exibida na listagem para ser "Aprovada" ou "Reprovada"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Aprovação de Pontos - Reprovar e Cancelar
    Dado que o admin acessou o menu "Treinamento"
    E acessou o submenu "Aprovação de Pontos"
    E na listagem existem execuções a serem "Aprovadas" ou "Reprovadas"
    Quando o admin acionar o botão "Ações" de uma determinada execução da lista
    E acionar a opção "Reprovar"
    Então será exibido o modal "Confirmar Reprovação" com os campos "Nome" e "Pontos" já preenchidos e o campo texto "Motivo" para ser preenchido pelo Admin
    E no modal "Confirmar Reprovação" conterá os botões "Cancelar" e "Reprovar"
    Quando o admin acionar a opção "Cancelar"
    Então o modal será fechado e o admin será direcionado para a tela "Aprovação de Pontos"
    E o registro da execução continuará sendo exibida na listagem para ser "Aprovada" ou "Reprovada"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Aprovação de Pontos - Aprovar e Confirmar
    Dado que o admin acessou o menu "Treinamento"
    E acessou o submenu "Aprovação de Pontos"
    E na listagem existem execuções a serem "Aprovadas" ou "Reprovadas"
    Quando o admin acionar o botão "Ações" de uma determinada execução da lista
    E acionar a opção "Aprovar"
    Então será exibido o modal "Confirmar Pontuação" com o texto "Deseja aprovar (x pontos) para (Usuário)?" e os botões "Cancelar" e "Aprovar"
    Quando o admin acionar a opção "Aprovar"
    Então será exibido o modal "Sucesso!" com o texto "Pontos aprovados com sucesso!"
    Quando o admin fechar o modal 
    Então o admin será direcionado para a tela "Aprovação de Pontos"
    E o registro da referida execução não será mais demonstrada na listagem
    E a pontuação aprovada para esta execução passará a ser demonstrada no Relatório de "Extrato de Pontos"



@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Aprovação de Pontos - Reprovar e Confirmar
    Dado que o admin acessou o menu "Treinamento"
    E acessou o submenu "Aprovação de Pontos"
    E na listagem existem execuções a serem "Aprovadas" ou "Reprovadas"
    Quando o admin acionar o botão "Ações" de uma determinada execução da lista
    E acionar a opção "Reprovar"
    Então será exibido o modal "Confirmar Reprovação" com os campos "Nome" e "Pontos" já preenchidos e o campo texto "Motivo" para ser preenchido pelo Admin
    E no modal "Confirmar Reprovação" conterá os botões "Cancelar" e "Reprovar"
    Quando o admin não preencher o campo "Motivo" e acionar a opção "Reprovar"
    Então será exibido o alerta "Preencha este campo" 
    Quando o admin preencher o campo "Motivo" e acionar a opção "Reprovar"
    Então será exibido o modal "Sucesso!" com o texto "Pontos reprovados com sucesso!"
    Quando o admin fechar o modal 
    Então o admin será direcionado para a tela "Aprovação de Pontos"
    E o registro da referida execução não será mais demonstrada na listagem
    E a pontuação Reprovada para esta execução não será demonstrada no Relatório de "Extrato de Pontos"
























