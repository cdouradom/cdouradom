#language: pt

Funcionalidade: Tabelas - Listagem de Tabelas
Como usuário administrador ativo na Plataforma
Quero acessar a tela de Lista de Tabelas
Para visualizar e editar as tabelas cadastradas
BD 
    product_points_import_history
    product_points_import_resale

    https://xd.adobe.com/view/769453ab-99c6-464c-9867-d8652f48212d-23c7/

-----    

Critérios de Aceitação:
Exibir breadcrumb
Acessado através do menu: Gerencial / Tabela de Pontos
Exibir um botão "Nova tabela"
Exibir um cabeçalho na tela "Lista de Tabelas"
Disponibilizar os filtros: "ID Tabela", "Tabela", "Grupo", "Rede", "Início vigência", "Fim vigência", "Status" e botão "Buscar"
Trazer por padrão o status "Ativo" filtrado e listar somente as tabelas Ativas
Trazer no filtro status: Ativo, Inativo e Todos
Trazer um select com autocomplete nos filtros "Grupo" e "Rede"
Aplicar paginação a cada 10 ou 20 registros
Botão "Npva Tabela" redireciona para tela de Importação da tabela
Filtros de datas deve aceitar somente valor numérico
Ordenar a listagem por ordem decrescente pelo "ID TABELA"
Exibir acima da listagem o texto informativo: "Foram encontrados ** registros" que é atualizado conforme filtros aplixado X resultados na listagem
Exibir uma listagem com cabeçalho: "ID Tabela", "Tabela" que é título da tabela cadastrada, "Rede" com tooltip, "Vigência" = 'Início | Fim', "Status" e botão "Editar"
Exibir na coluna "Rede" um tooltip que ao passar o mouse exibe todas vinculadas a respectiva Tabela
Botão Editar abre um modal para edição da tabela: "Editar Dados"
Modal de edição exibe os campos abaixo com os botões "Cancelar" e "Salvar": 
    - "Título" -- nome da tabela de pontuação 'bloqueado para edição'
    - "Status" -- campo editável [lista suspensa com as opções “Ativo” e “Inativo”]
    - "Início da vigência*" -- campo editável
    - "Fim da vigência*" -- campo editável
    - "Redes" -- campo editável de autocomplete como tags em que o admin poderá inserir as redes que desejar
    - "Selecionar todas" -- campo editável, sendo um Checkbox que seleciona e deseleciona todas as Redes de uma vez
Ao editar uma tabela, o ID da tabela editada é inativado e o sistema cria uma nova tabela com novo ID, mantendo o histórico das configurações da tabela anterior
Na edição, não permitir conflito para o mesmo período e Rede (parcial/integral)
Na edição, o input "Rede" aceita múltiplas Redes como tags


---

@manual
@Tarefa_#:61002
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-tabelas-acessar-e-layout-I.mp4,assets/A-tabelas-acessar-e-layout-II.png,assets/A-tabelas-acessar-e-layout-III.png
    Cenário: Tabelas - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu principal "Gerencial"
        E acionar o menu "Tabela de Pontuação"
        E acionar o submenu "Tabelas"
        Então o sistema redireciona para a tela da "Lista de Tabelas"
        E por default o filtro "Status" vem com a opção "Ativo"
        E exibe somente as tabelas deste status na listagem em ordem decrescente pelo ID da Tabela
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | ID Tabela | Tabela            | Redes                                         | Vigência                   | Status           | Botão/Ações |
            | 001       | Título cadastrado | tooltip que exibe as redes qndo passa o mouse | Início e Fim (data e hora) | Ativo ou Inativo | Editar      |
        #fazer evidência acessando quando ainda não tem tabelas e depois já com tabelas  


@manual
@Tarefa_#:61002
@ajuste_#:62451
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-tabelas-filtrar-I.mp4,assets/A-tabelas-filtrar-II.mp4
    Esquema do Cenário: Tabelas - Filtrar
        Dado que o admin esta na listagem da "Lista de Tabelas"
        Quando realizar busca através dos filtros com dados não existentes nesta campanha
        E acionar o botão "Buscar"
        Então o sistema retorna com a mensagem "Nenhuma tabela encontrada"
        Quando preencher todos, alguns ou um dos filtros "<ID Tabela>", "<Nome da tabela>", "<Grupo>", "<Rede>", "<Início Vigência>", "<Fim Vigência>" e "<Status>" com valores existentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar o valor no texto informativo " Foram encontrados ** registros"
        E exibirá na listagem somente o(s) registro(s) respectivo(s) à busca conforme "<Resultado do sistema>"
            Exemplos:
            | <ID Tabela> | <Nome da tabela> | <Grupo>    | <Rede>     |  <Início Vigência> | <Fim Vigência> | <Status>  | <Resultado do Sistema>                                                                                                   |
            | 'existente' |                  |            |            |                    |                | 'Todos'   | Serão listadas somente a Tabela deste respectivo ID                                                                    |
            |             | 'Tabela teste'   |            |            |                    |                | "Todos"   | Serão listadas todas as tabelas Ativas e Inativas com este termo no nome                                               |
            |             |                  | 'da lista' |            |                    |                | "Todos"   | Serão listadas todas as tabelas Ativas e Inativas para Redes deste Grupo                                            |
            |             |                  |            | 'da lista' |                    |                | "Todos"   | Serão listadas todas as tabelas Ativas e Inativas para Redes desta Rede                                             |
            |             |                  |            |            |  '01/10/2022'      |                | "Todos"   | Serão listadas todas as tabelas Ativas e Inativas com início nesta data ou que tenha essa data dentro de sua vigência  |
            |             |                  |            |            |  '01/10/2022'      |                | "Ativo"   | Serão listadas somente as tabelas Ativas com término nesta data ou que tenha essa data dentro de sua vigência          |
            |             |                  |            |            |                    | <31/10/2022>   | "Todos"   | Serão listadas todas as tabelas Ativas e Inativas com término nesta data ou que tenha essa data dentro de sua vigência |
            |             |                  |            |            |                    | <31/10/2022>   | "Inativo" | Serão listadas somente as tabelas Inativas com término nesta data ou que tenha essa data dentro de sua vigência        |
            |             |                  |            |            |  '01/10/2022'      | <31/10/2022>   | "Ativo"   | Serão listadas somente as tabelas Ativas com início e término nessa vigência                                           |
            |             |                  |            |            |  '01/10/2022'      | <31/10/2022>   | "Inativo" | Serão listadas somente as tabelas Inativas com início e término nessa vigência                                         |
            |             |                  |            |            |                    |                | "Ativo"   | Serão listadas somente as tabelas Ativas                                                                               |
            |             |                  |            |            |                    |                | "Inativo" | Serão listadas somente as tabelas Inativas                                                                             |
            |             |                  |            |            |                    |                | 'Todos'   | Serão listadas todas as tabelas da campanha; E a tela terá paginação a cada 10 linhas                                  |
#62451 - Ocorre erro ao filtrar por Grupo e/ou Rede

@manual
@Tarefa_#:61002
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-editar-tabela-acessar-layout-e-cancelar.mp4
    Cenário: Editar Tabela - Acessar, Layout e Cancelar
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Editar" na lista de Tabelas
        Então um modal será apresentado com os dados e datas da tabela conforme cadastrada
        E os campos "Título" é exibido bloqueado para edição
        Mas os demais campos permitem edições
        E o campo "Redes" exibe as já vinculadas a essa tabela como tags, funcionando com autocomplete para que o admin insira ou remova as redes individual ou através do checkbox "Selecionar todas"
        E o Status exibe as opções "Ativo" e "Inativo", sem opção vazio
        Quando acionar o botão "Cancelar"
        Então o sistema fecha o modal encerrando a edição
        E mantém na Lista de Tabelas


@manual
@Tarefa_#:61002
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-editar-tabela-campos-invalidos-I.mp4,assets/A-editar-tabela-campos-invalidos-II.mp4
    Cenário: Editar Tabela - Campos inválidos
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Editar" na lista de Tabelas
        E deletar as informações dos campos "Redes", "Início Vigência" e "Fim Vigência"
        E acionar o botão "Salvar"
        Então o sistema vai retornar a mensagem "Preencha este campo" em cada campo por serem obrigatórios
        E não vai fazer nenhuma alteração mantendo o admin no modal de edição
        Quando preencher com "Fim Vigência" menor que o "Início Vigência"
        E acionar o botão "Salvar"
        Então o sistema vai alerta com "Fim vigência deve ser maior que Início vigência" 
        E não vai fazer nenhuma alteração mantendo o admin no modal de edição
# Não é possível digitar datas inválidas, pois o sistema permite apenas a seleção da data pelo calendário

@manual
@Tarefa_#:61002
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-editar-tabela-alterar-status.mp4
    Cenário:  Editar Tabela - Alterar Status
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Editar" em uma tabela da listagem
        E alterar o status de "Ativo" para "Inativo"
        E acionar o botão "Salvar"
        Então o sistema cria um clone dessa tabela com ID novo/maior
        E altera o status de ambas as tabelas (origem e clone) para "Inativa"
        E como por default a Lista de Tabelas vem filtrada somente pelas ativas, não as exibem
        Mas se filtrar por Status Todos ou Inativo, as tabelas (origem e clone) serão listadas
        Quando o admin alterar o status de "Inativo" para "Ativo" em uma tabela da listagem
        E acionar o botão "Salvar"
        Então o sistema cria um clone dessa tabela com ID novo/maior
        E altera o status da tabela clone para "Ativa"
        E a exibe na Listagem de Tabelas que por default vem filtrada somente pelas ativas
        Mas mantém a tabela que já era inativa neste status


@manual
@Tarefa_#:61002
@ajuste_#:62324
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-editar-tabela-conflito-de-vigencia-e-redes.mp4,assets/A-editar-tabela-conflito-de-vigencia-e-redes-II.mp4
    Cenário:  Editar Tabela - Conflito de Vigências e Redes
        Dado que a tabela de ID "123" tem a vigência de 01/10/2022 até 31/10/2022 para as Redes A, B e C
        E a tabela de ID "456" tem a vigência de 01/10/2022 até 15/10/2022 para a Rede D
        E a tabela de ID "789" tem a vigência de 16/10/2022 até 31/10/2022 para a Rede E
        Quando o admin editar a tabela de ID "001" com vigência 01/09/2022 até 30/09/2022 para as Redes A, B, C, D e E
        E alterar o Fim da vigência para qualquer dia de outubro/2022
        E acionar o botão "Salvar"
        Então o sistema vai exibir um alerta "Vigência já importada" com a mensagem abaixo:
            | Já existe uma tabela de produtos importada para o período de vigência informado e para a(s) rede(s) abaixo             |
            | <Nome rede 1>                                                                                                          |
            | <Nome rede 2>                                                                                                          |
            | Verifique se existe a necessidade de subir uma nova tabela para este período e inative a anterior antes de prosseguir. |
            | botões "Salvar" e "Cancelar"                                                                                                             |
        Quando o admin editar a tabela de ID "123" com vigência de 01/10/2022 até 31/10/2022 para as redes A, B e C
        E adicionar as Redes D e E
        E acionaro botão "Salvar"
        Então o sistema vai exibir um alerta "Vigência já importada" com a mensagem abaixo:
            | Já existe uma tabela de produtos importada para o período de vigência informado e para a(s) rede(s) abaixo             |
            | <Nome rede 1>                                                                                                          |
            | <Nome rede 2>                                                                                                          |
            | Verifique se existe a necessidade de subir uma nova tabela para este período e inative a anterior antes de prosseguir. |
            | botões "Salvar" e "Cancelar"                                                                                            |
        E não vai fazer nenhuma alteração mantendo o admin no modal de edição quando o admin clicar em "Cancelar"
#62324 - Erro - mesma vigência - redes diferentes - Ocorre crítica e não permite a importação

@manual
@Tarefa_#:61002
@ajuste_#:62324
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-editar-tabela-conflito-de-vigencia-para-diferentes-redes.mp4
    Cenário:  Editar Tabela - Conflito de Vigências para diferentes Redes
        Dado que já existe uma tabela "0022" com a vigência de 01/11/2022 até 30/11/2022 para as Redes X e Z
        E o admin acessou a edição da tabela "123" que tem vigência de 01/10/2022 até 31/10/2022 para as Redes A, B e C
        Quando alterar a vigência da tabela "123" para de 01/11/2022 até 30/11/2022 mantendo as mesmas Redes A, B e C
        E acionar o botão "Salvar"
        Então o sistema faz a devida alteração
        E cria um clone da tabela "123" com ID novo/maior e status "Ativo"
        E altera o status da tabela de origem "123" para "Inativo"
        E exibe a nova tabela (ID do clone) na Lista de Tabelas que por or default vem filtrada somente pelas ativas
        E mantém as duas tabelas "0044" (ID do clone) e a "0022" com a mesma vigência já que são para Redes diferentes 

#62324 - Erro - mesma vigência - redes diferentes - Ocorre crítica e não permite a importação


@manual
@Tarefa_#:61002
@manual-result:success
@manual-last-tested:20-10-2022
@manual-test-evidence:assets/A-editar-tabela-remover-e-inserir-redes-que-nao-se-conflitam-na-vigencia.mp4
    Cenário:  Editar Tabela - Remover e Inserir Redes que não se conflitam na vigência
        Dado que o admin acessou a edição de uma tabela
        Quando remover uma Rede desta tabela
        E acionar o botão "Salvar"
        Então o sistema faz a devida alteração
        E cria um clone dessa tabela com ID novo/maior com status "Ativo"
        E altera o status da tabela de origem para "Inativo"
        E exibe a nova tabela (ID no clone) na Lista de Tabelas que por or default vem filtrada somente pelas ativas
        Dado que o admin acessou edição desta e/ou de outra tabela
        Quando inserir uma Rede que ainda não possui uma tabela para essa mesma Vigência
        E acionar o botão "Salvar"
        Então o sistema faz a devida alteração
        E cria um clone dessa tabela com ID novo/maior com status "Ativo"
        E altera o status da tabela de origem para "Inativo"
        E exibe a nova tabela (ID no clone) na Lista de Tabelas que por or default vem filtrada somente pelas ativas

@manual
@Tarefa_#:61002
@ajuste_#:62466
@ajuste_#:62706
@manual-result:success
@manual-last-tested:25-10-2022
@manual-test-evidence:assets/A-editar-tabela-ativa-com-produtos-que-foram-inativados-na-tabela-de-pontuacao.mp4
    Cenário:  Editar Tabela Ativa com produtos que foram Inativados na Tabela de Pontuação
        Dado que o admin acessou a tela "Tabela de Pontuação" sendo os registros da Tabela #condição em outra tela para validar cenário 
        Quando alterar o status de um produto para "Inativo" da Tabela de ID 123 #um ou varios, ou todos
        Então a lista de produtos exibirá cada produto com seu status no ID desta Tabela de Pontuação 123
        Quando o admin acessar a "Edição" desta Tabela Ativa já na lista de "Tabelas" #agora ação nesta tela para refletir na Tabela de Pontuação
        E realizar qualquer alteração de vigência, redes ou status desta Tabela de ID 123
        E acionar o botão "Salvar"
        Então o sistema cria um clone dessa tabela com ID novo/maior e status "Ativo" (conforme status da tabela origem)
        Mas altera o status da tabela de origem de ID 123 para "Inativo"
        E exibe a nova tabela (ID no clone 1234) na Lista de Tabelas que por default vem filtrada somente pelas ativas
        Quando o admin acessar novamente a tela "Tabela de Pontuação" sendo os registros da Tabela
        Então o ID 123 não estará disponível
        Mas sim, a tabela de pontuação da tabela 1234
        E os status dos produtos nesta nova tabela (clone) devem ser iguais aos que já haviam na tabela 123, inclusive do(s) produto(s) que foi alterado para "Inativo"        
#62466 - Editar Dados não está funcionando - O botão não funciona.
#62706 - Alteração da vigência não mantém alterações do status dos produtos

@manual
@Tarefa_#:61002
@ajuste_#:62466
@ajuste_#:62706
@manual-result:failed
@manual-last-tested:
@manual-test-evidence:
    Cenário:  Editar Tabela Inativa com produtos que foram Inativados na Tabela de Pontuação
        Dado que o admin acessou a tela "Tabela de Pontuação" sendo os registros da Tabela #condição em outra tela para validar cenário | #precisa puxar a Tabela pela url com ID da tabela Inativa
        Quando alterar o status de um produto para "Inativo" da Tabela de ID 456 #um ou varios, ou todos
        Então a lista de produtos exibirá cada produto com seu status no ID desta Tabela de Pontuação 456
        Quando o admin acessar a "Edição" desta Tabela INATIVA já na lista de "Tabelas" #agora ação nesta tela para refletir na Tabela de Pontuação
        E realizar qualquer alteração de vigência, redes ou status desta Tabela de ID 123
        E acionar o botão "Salvar"
        Então o sistema cria um clone dessa tabela com ID novo/maior e status "Inativo" (conforme status da tabela origem)
        E mantém o status da tabela de origem de ID 456 para "Inativo"
        E exibe ambas as tabelas (ID origem 456 e ID no clone 4567) somente se filtrar por Status Inativo na Lista de Tabelas, pois por default vem filtrada somente pelas ativas
        Quando o admin acessar novamente a tela "Tabela de Pontuação" sendo os registros da Tabela
        Então ambas as tabelas não estarão disponíveis no filtro
        Quando alterar na url o ID de uma tabela ativa qualquer para o ID das tabelas Inativas 456 ou 4567
        Então os status dos produtos nesta nova tabela (clone ID 4567) devem ser iguais aos que já haviam na tabela origem 456, inclusive do(s) produto(s) que foi alterado para "Inativo"        
#62466 - Editar Dados não está funcionando - O botão não funciona.
#62706 - Alteração da vigência não mantém alterações do status dos produtos


@manual
@Tarefa_#:61002
@ajuste_#:62466
@ajuste_#:62706
@manual-result:failed
@manual-last-tested:
@manual-test-evidence:
    Cenário:  Inativar Tabela com produtos que foram Inativados na Tabela de Pontuação
        Dado que o admin acessou a tela "Tabela de Pontuação" sendo os registros da Tabela #condição em outra tela para validar cenário 
        Quando alterar o status de um produto para "Inativo" da Tabela de ID 789 #um ou varios, ou todos
        Então a lista de produtos exibirá cada produto com seu status no ID desta Tabela de Pontuação 789
        Quando o admin acessar a "Edição" desta Tabela ainda Ativa já na lista de "Tabelas" #agora ação nesta tela para refletir na Tabela de Pontuação
        E alterar o status desta Tabela de ID 789 para "Inativo"
        E acionar o botão "Salvar"
        Então o sistema cria um clone dessa tabela com ID novo/maior e status "Inativo" (conforme status atual da tabela origem)
        E mantém o status da tabela de origem de ID 789 para "Inativo"
        E exibe ambas as tabelas (ID origem 789 e ID no clone 7891) somente se filtrar por Status Inativo na Lista de Tabelas, pois por default vem filtrada somente pelas ativas
        Quando o admin acessar novamente a tela "Tabela de Pontuação" sendo os registros da Tabela
        Então ambas as tabelas não estarão disponíveis no filtro
        Quando alterar na url o ID de uma tabela ativa qualquer para o ID das tabelas Inativas 789 ou 7891
        Então os status dos produtos nesta nova tabela (clone ID 7891) devem ser iguais aos que já haviam na tabela origem 789, inclusive do(s) produto(s) que foi alterado para "Inativo"        
#62466 - Editar Dados não está funcionando - O botão não funciona.
#62706 - Alteração da vigência não mantém alterações do status dos produtos

@manual
@Tarefa_#:61002
@manual-result:success
@manual-last-tested:20-10-2022
@manual-test-evidence:assets/A-lista-de-tabelas-paginacao-e-transicao.mp4
    Cenário: Lista de Tabelas - Paginação e transição
    Dado que o admin esta na tela de "Lista de Tabelas"
    E existem registros gerando paginação
    Quando o admin transitar para as próximas páginas ou para as páginas anteriores
    Então o sistema irá redirecionar para as outras páginas sem erros



@manual
@Tarefa_#:61002
@manual-result:success
@manual-last-tested:20-10-2022
@manual-test-evidence:assets/A-tabelas-listagem-logs-em-BD.png
    Cenário: Log de Edição em BD 
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos:
#As alterações nas tabelas não são gravas na tabela log. As alterações inserem sempre um novo registro na product_points_import_history, com um novo ID.


@manual
@Tarefa_#:66854
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-nova-tabela-selecionar-redes-14-12-2022.mp4,A-nova-tabela-selecionar-redes-14-12-2022-II.mp4
    Cenário: Nova Tabela - Selecionar redes
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Nova Tabela"
        E preencher com dados válidos os campos "Início da Vigência", "Fim da Vigência" e "Título"
        E selecionar algumas redes na listagem do campo "Rede"
        Então ao abrir novamente a listagem do campo "Rede", as redes que já estão selecionadas não aparecem mais na listagem para serem escolhidas novamente


@manual
@Tarefa_#:66854
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-nova-tabela-selecionar-todas-as-redes-manualmente-14-12-2022.mp4,assets/A-nova-tabela-selecionar-todas-as-redes-manualmente-14-12-2022-II.mp4
    Cenário: Nova Tabela - Selecionar todas as redes manualmente
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Nova Tabela"
        E preencher com dados válidos os campos "Início da Vigência", "Fim da Vigência" e "Título"
        E selecionar todas as redes, manualmente, uma por uma, na listagem do campo "Rede"
        Então após selecionar a última rede da listagem, ao abrir novamente a listagem do campo "Rede", nenhuma rede será demonstrada para ser selecionada
        E o checkbox "Selecionar Todas as Redes" ficará acionado automaticamente

@manual
@Tarefa_#:66854
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-nova-tabela-selecionar-todas-as-redes-Checkbox-Selecionar-Todas-as-Redes-14-12-2022.mp4
    Cenário: Nova Tabela - Selecionar todas as redes - Checkbox "Selecionar Todas as Redes"
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Nova Tabela"
        E preencher com dados válidos os campos "Início da Vigência", "Fim da Vigência" e "Título"
        E acionar o checkbox "Selecionar Todas as Redes"
        Então ao abrir novamente a listagem do campo "Rede", nenhuma rede será demonstrada para ser selecionada
        E o checkbox "Selecionar Todas as Redes" ficará acionado automaticamente

@manual
@Tarefa_#:66854
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-nova-tabela-selecionar-todas-as-redes-Checkbox-Selecionar-Todas-as-Redes-Desmarcar-Redes-14-12-2022
    Cenário: Nova Tabela - Selecionar todas as redes - Checkbox "Selecionar Todas as Redes" - Desmarcar Redes
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Nova Tabela"
        E preencher com dados válidos os campos "Início da Vigência", "Fim da Vigência" e "Título"
        E acionar o checkbox "Selecionar Todas as Redes"
        Então ao abrir novamente a listagem do campo "Rede", nenhuma rede será demonstrada para ser selecionada
        E ao excluir alguma rede da listagem 
        Então o o checkbox "Selecionar Todas as Redes" será desmarcado automaticamente
        E ao abrir novamente a listagem do campo "Rede", as redes que foram desmacadas aparecerão na listagem para serem selecionadas


@manual
@Tarefa_#:66854
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-tabela-edicao-listagem-de-redes-demonstra-somente-nao-selecionadas-14-12-2022.mp4
    Cenário: Tabela - Edição - Listagem de Redes - Demonstra somente não selecionadas
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Editar"
        Então será aberto o modal "Editar Dados"
        E no campo "Rede" serão listadas as redes que foram originalmente selecionadas quando a tabela foi criada
        Então abrir a listagem do campo "Rede", as redes que já estão selecionadas não aparecem mais na listagem para serem escolhidas novamente


@manual
@Tarefa_#:66854
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/A-tabela-edicao-listagem-de-redes-selecionar-todas-manualmente-14-12-2022.mp4
    Cenário: Tabela - Edição - Listagem de Redes - Selecionar todas manualmente
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Editar"
        Então será aberto o modal "Editar Dados"
        E ao selecionar todas as redes, manualmente, uma por uma, na listagem do campo "Rede"
        Então após selecionar a última rede da listagem, ao abrir novamente a listagem do campo "Rede", nenhuma rede será demonstrada para ser selecionada
        E o checkbox "Selecionar Todas as Redes" ficará acionado automaticamente


@manual
@Tarefa_#:66854
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/A-tabela-edicao-listagem-de-redes-selecionar-todas-as-redes-Checkbox-Selecionar-Todas-as-Redes-14-12-20222.mp4
    Cenário: Tabela - Edição - Listagem de Redes - Selecionar todas as redes - Checkbox "Selecionar Todas as Redes"
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Editar"
        Então será aberto o modal "Editar Dados"
        E ao acionar o checkbox "Selecionar Todas as Redes"
        Então todas as redes serão selecionadas
        E ao abrir novamente a listagem do campo "Rede", nenhuma rede será demonstrada para ser selecionada
        E o checkbox "Selecionar Todas as Redes" ficará acionado automaticamente



@manual
@Tarefa_#:66854
@ajuste_#:67028
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-tabela-edicao-listagem-de-redes-selecionar-todas-as-redes-Checkbox-Selecionar-Todas-as-Redes-desmarcar-redes-14-12-20222.mp4
    Cenário: Tabela - Edição - Listagem de Redes - Checkbox "Selecionar Todas as Redes" - Desmarcar Redes
        Dado que existem tabelas listadas 
        Quando o admin acionar o botão "Editar"
        Então será aberto o modal "Editar Dados"
        E ao acionar o checkbox "Selecionar Todas as Redes"
        Então todas as redes serão selecionadas
        E ao abrir novamente a listagem do campo "Rede", nenhuma rede será demonstrada para ser selecionada
        E ao excluir alguma rede da listagem 
        Então o o checkbox "Selecionar Todas as Redes" será desmarcado automaticamente
        E ao abrir novamente a listagem do campo "Rede", as redes que foram desmacadas aparecerão na listagem para serem selecionadas
#67028 - As redes estão sendo removidas apenas na segunda tentativa. OBS: Conforme comentado no card, este comportamento faz parte do componente

@manual
@Tarefa_#:66854
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-tabela-listagem-Tooltip-Redes-14-12-2022.mp4
    Cenário: Tabela Listagem - Tooltip - Redes
        Dado que existem tabelas listadas 
        E todos os campos estão alinhados corretamente
        Quando o admin posicionar o mouse sobre o ícone de informação "i" de qualquer tabela
        Então será exibido um Tooltip com a descrição "Clique aqui para listar as redes"
        E ao acionar o ícone de informação "i"
        Então será exibido o modal "Redes" com todas as redes vinculadas à tabela de pontos
       

@manual
@Tarefa_#:66854
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-tabela-listagem-Tooltip-Redes-Modal-14-12-2022.mp4
    Cenário: Tabela Listagem - Tooltip - Redes - Modal
        Dado que existem tabelas listadas 
        E todos os campos estão alinhados corretamente
        Quando o admin posicionar o mouse sobre o ícone de informação "i" de qualquer tabela
        Então será exibido um Tooltip com a descrição "Clique aqui para listar as redes"
        E ao acionar o ícone de informação "i"
        Então será exibido o modal "Redes" com todas as redes vinculadas à tabela de pontos
        E se houver mais de 31 redes vinculadas, será possível utilizar o scrool para subir e descer a lista
        E será possível fechar o modal clicando no X






#23 CN