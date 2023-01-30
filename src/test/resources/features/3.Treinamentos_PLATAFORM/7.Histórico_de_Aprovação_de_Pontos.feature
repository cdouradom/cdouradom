#language: pt

Funcionalidade: Treinamentos - Histórico de Aprovação de Pontos
 Como administrador da campanha
 Quero acessar o Histórico de Aprovação de Pontos
 Para conferir os pontos que foram aprovados aos usuários

point_statement_history

-----

Critérios de Aceitação:
Somente serão apresentados os registros que foram aprovados ou reprovados pela tela "Aprovação de Pontos"

---

@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Histórico de Aprovação de Pontos - Acesso e Layout
	Dado que o admin acessou o menu "Treinamentos"
	Quando acionar o submenu "Aprovação de Pontos"
	Então o sistema redirecionará o admin para a tela "Aprovação de Pontos"
    Quando acionar o botão "Ver Histórico de Aprovação"
    Então o sistema redirecionará o admin para a tela "Histórico de Aprovações"
	E os elementos abaixo serão exibidos

            | Breadcrumbs | Com o Caminho para essa tela                                                                                      |
            | Título      | "HISTÓRICO DE APROVAÇÕES"                                                                                         |
            | Filtros     | "Nome", "CPF/CNPJ", "Admin", "Treinamento", "Quiz", "Data Inicial", "Data Final", "Aprovação de", "Aprovação até" |
            | Botão       | "Buscar"                                                                                                          |
            | Listagem    | conforme cabeçalho: Colunas Usuário, Quiz, Desempenho Status e Motivo (ícone "i" exibe modal com motivo)          |
            | Listagem    | conforme rodapé: Texto informativo "Foram encontrados x resultados"                                               |
            | Listagem    | conforme rodapé: Paginação e botão "Exportar"                                                                     |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Histórico de Aprovação de Pontos - Filtros
	Dado que o admin esta na tela "Histórico de Aprovações"
	Quando preencher os filtros "Nome", "CPF/CNPJ", "Admin", "Treinamento", "Quiz", "Data Inicial", "Data Final", "Aprovação de", "Aprovação até" 
	E clicar em "Buscar"
	Então o sistema exibirá os seguintes resultados:
	Exemplos: 
            | <Nome>      | <CPF/CNPJ> | <Admin>  | <Treinamento> | <Quiz>   | <Data Inicial>     | <Data Final>       | <Aprovação de>     | <Aprovação até>    | <Resultado>                                                      |
            | Existente   | Vazio      | Vazio    | Vazio         | Vazio    | Vazio              | Vazio              | Vazio              | Vazio              | Retorna treinamentos que contenham como usuário o valor inserido |
            | Inexistente | Vazio      | Vazio    | Vazio         | Vazio    | Vazio              | Vazio              | Vazio              | Vazio              | Nenhum Resultado Encontrado                                      |
            | Inexistente | existente  | Da lista | Da lista      | Da lista | Vazio              | Vazio              | Vazio              | Vazio              | Nenhum Resultado Encontrado                                      |
            | Vazio       | Vazio      | Vazio    | Vazio         | Vazio    | Vazio              | Vazio              | Vazio              | Vazio              | Retorna todos os treinamentos aprovados e reprovados             |
            | Existente   | existente  | Vazio    | Vazio         | Vazio    | Vazio              | Vazio              | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | existente  | Vazio    | Vazio         | Vazio    | Vazio              | Vazio              | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Da lista | Vazio         | Vazio    | Vazio              | Vazio              | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio    | Da lista      | Vazio    | Vazio              | Vazio              | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio    | Vazio         | Da Lista | Vazio              | Vazio              | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio    | Vazio         | Vazio    | Existente e Válida | Vazio              | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio    | Vazio         | Vazio    | Vazio              | Existente e Válida | Vazio              | Vazio              | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio    | Vazio         | Vazio    | Vazio              | Vazio              | Existente e Válida | Vazio              | Retorna treinamentos que contém o valor inserido                 |
            | Vazio       | Vazio      | Vazio    | Vazio         | Vazio    | Vazio              | Vazio              | Vazio              | Existente e Válida | Retorna treinamentos que contém o valor inserido                 |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Histórico de Aprovação de Pontos - Paginação
    Dado que o admin esta na tela "Histórico de Aprovações"
    Quando existem mais de 20 registros
    Então o admin vizualizará no rodapé as páginas disponíveis
    E será possível realizar a transição entre as páginas


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Histórico de Aprovação de Pontos - Incrementação após Aprovar
    Dado que o admin acabou de aprovar a pontuação de uma execução na tela de 'Aprovação de Pontos'
    Quando o admin acessar o menu "Treinamento"
    E acessar o submenu "Aprovação de Pontos"
    E acionar o botão "Ver Histórico de Aprovação"
    Então o admin vizualizará a execução do treinamento que foi aprovado
    E a listagem exibirá as seguintes informações: "Usuário e CPF/CNPJ", "Nome do quiz, do treinamento e data/hora de execução", "Percentual de desempenho e Pontos", "Status, usuário que aprovou/reprovou, data/hora da aprovação" e "Motivo"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Histórico de Aprovação de Pontos - Incrementação após Reprovar
    Dado que o admin acabou de Reprovar a pontuação de uma execução na tela de 'Aprovação de Pontos'
    Quando o admin acessar o menu "Treinamento"
    E acessar o submenu "Aprovação de Pontos"
    E acionar o botão "Ver Histórico de Aprovação"
    Então o admin vizualizará a execução do treinamento que foi reprovado
    E a listagem exibirá as seguintes informações: "Usuário e CPF/CNPJ", "Nome do quiz, do treinamento e data/hora de execução", "Percentual de desempenho e Pontos", "Status, usuário que aprovou/reprovou, data/hora da aprovação" e "Motivo"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Histórico de Aprovação de Pontos - Exibição do modal "Motivo"
    Dado que o admin acabou de Reprovar a pontuação de uma execução na tela de 'Aprovação de Pontos'
    Quando o admin acessar o menu "Treinamento"
    E acessar o submenu "Aprovação de Pontos"
    E acionar o botão "Ver Histórico de Aprovação"
    Então o admin vizualizará a execução do treinamento que foi reprovado
    Quando acionar o ícone "i" da coluna "Motivo"
    Então será exibido o modal "Motivo" com a descrição do motivo 


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Exportar
	Dado que o admin acessou a tela "Histórico de Aprovações"
    Quando acionar o botão "Exportar"
    Então será exibida a tela do explorador de arquivos para salvar o relatório
    E o arquivo será salvo com o nome "Relatório de Pontos por Quiz.xlsx"
    Quando o admin abrir o arquivo
    Então visualizará as colunas "CPF/CNPJ", "Nome", "ID Treinamento", "Treinamento", "Módulo", "Pontos", "% de Acertos", "Data do Treinamento", "Status", "Aprovado/Reprovado em",	"Aprovado/Reprovado por", "Motivo"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Exportar - Com filtro aplicado
	Dado que o admin acessou a tela "Histórico de Aprovações"
    E aplicou um ou mais filtros
    E acionou o botão "Buscar"
    Então o sistema exibe os registros na listagem, de acordo com os filtros aplicados
    Quando acionar o botão "Exportar"
    Então será exibida a tela do explorador de arquivos para salvar o relatório
    E o arquivo será salvo com o nome "Relatório de Pontos por Quiz.xlsx"
    Quando o admin abrir o arquivo
    Então visualizará as colunas "CPF/CNPJ", "Nome", "ID Treinamento", "Treinamento", "Módulo", "Pontos", "% de Acertos", "Data do Treinamento", "Status", "Aprovado/Reprovado em",	"Aprovado/Reprovado por", "Motivo"
    E os registros do relatório corresponderão aos mesmos registros filtrados na listagem da tela "Histórico de Aprovações"
 







