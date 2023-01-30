#language: pt

Funcionalidade: Listagem_Quiz
 Como administrador da campanha
 Quero consultar a listagem de Quizzes
 Para a utilização nos treinamento disponibilizados aos participantes no Banking

account_subcampaign_quiz


Critérios de Aceitação:
 Cada Quiz é composto por pelo menos um nome, uma pergunta, uma resposta certa e uma resposta errada
 Todo quiz precisa ter sua resposta certa evidenciada
 Cada pergunta poderá ter apenas 1 resposta correta
 São permitidas exclusões de todas as  perguntas e respostas de uma seção de questão durante o cadastro e edição do Quiz
 É permitido gravar o Quiz sem valor nos campos "% mínima de acerto", "Pontos recebidos" e "Máximo de Questões"
 Edições nas perguntas e respostas não são permitdas após o cadastro do quiz
 Limite de caracateres no Nome do Quiz é de 150
 Limite de caracteres na pergunta é de ****
 Limite de caracteres na resposta é de ****
 Não devo conseguir acessar/editar os IDs de Quizzes de outras campanhas via url

@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Acesso e Listagem
	Dado que o admin está logado na Plataforma
	Quando clicar o menu Treinamento
	E clicar no submenu Quiz
	Então o sistema redireciona o admin para a listagem de Quizzes
	Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumb |
            | Botão      | "Cadastrar" |
            | Filtros    | Nome do Quiz e botão Buscar |
            | Ações      | com botão "Ações" e submenus "Editar" e "Excluir" |
            | Listagem   | conforme cabeçalho: Nome, Data, e Ações |
            | Listagem   | conforme rodapé: Texto informativo "Foram encontrados x resultados" |
            




@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Esquema do Cenário: Quiz - Filtrar
        Dado que já existem quizzes cadastrados
        Quando o admin não realizar nenhum busca
        E acionar o botão "Buscar"
        Então todos os registros serão exibidos na listagem
        E o total de resultados encontrados será conforme o total de quizes
        Quando o admin realizar buscas no campo "<Nome>"
        E acionar o botão "Buscar"
        Então o sistema realiza a busca nos registros da campanha 
        E atualiza o valor no texto informativo " Foram encontrados xxx resultados"
        E retorna na listagem conforme "<Resultado do sistema>"
	Exemplos:
            | <Nome>      | <Resultado do sistema>                                                       |
            | Vazio       | Lista todos os quizzes                                                       |
            | Inexistente | Listagem fica vazia                                                          |
            | Existente   | Lista somente os quizzes que contenham em suas descrições o termo pesquisado |


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Paginação
	Dado que o admin acessou a tela de Quiz
	E existem registros que necessite de paginação
	Quando o admin clicar na "Página 2" ou outra
	Então o sistema redireciona o admin para a respectiva página
	E exibirá a listagem conforme os dados da mesma
