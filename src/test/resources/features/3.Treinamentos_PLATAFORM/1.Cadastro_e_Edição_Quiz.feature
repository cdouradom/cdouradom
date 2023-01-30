#language: pt

Funcionalidade: Quiz
 Como administrador da campanha
 Quero fazer a configuração de quizzes
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
 Esquema do Cenário: Treinamentos - Quiz - Botão Cadastrar
	Dado que o admin acessou a tela de Quiz
	Quando clicar no botão "Cadastrar"
	Então o sistema redireciona o admin para o formulário de Cadastro de Quiz
	Quando o admin visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente
			| Região Dados | Campo "Nome","% Mínima de acerto", "Pontos recebidos" e "Máximo de Questões" |
			| Botões       | "Voltar", "Adicionar Pergunta" e "Salvar"                                    |


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Botão Cadastrar - Adicionar Pergunta
	Dado que o admin acessou a tela de Quiz
	Quando clicar no botão "Cadastrar"
	Então o sistema redireciona o admin para o formulário de Cadastro de Quiz
	Quando o admin visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente
			| Região Dados | Campo "Nome","% Mínima de acerto", "Pontos recebidos" e "Máximo de Questões" |
			| Botões       | "Voltar", "Adicionar Pergunta" e "Salvar"                                    |

	Quando clicar no botão "Adicionar Pergunta"
	Então o sistema abre a região "Questão"
	Então os elementos da tela estão alinhados corretamente
	    |Região Questão| Campo "Pergunta", "Resposta"(correta), e "Resposta"(errada)|
	    
    	

@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Voltar
	Dado que o admin acessou a tela de Quiz
	Quando clicar no botão "Cadastrar"
	Então o sistema redireciona o admin para o formulário de Cadastro de Quiz
	E preencheu o nome do quiz
	E preencheu o campo "% mínima de acerto"
	E preencheu o campo "Pontos recebidos"
	E preencheu o campo "Máximo de questões"
	E acionou o botão "Adicionar Pergunta"
	E preencheu o campo "Pergunta"
	E preencheu o campo "Resposta"
	E marcou o campo "Correta"
	E preencheu o campo "Resposta"
	Quando acionou o botão "Voltar"
	Então o sistema redireciona o admin para a listagem de Quizzes interrompendo o cadastro


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Cadastrar - Campos não preenchidos
	Dado que o admin acessou a tela de Quiz
	Quando clicar no botão "Cadastrar"
	Então o sistema redireciona o admin para o formulário de Cadastro de Quiz
	Quando não preencheer os campos "Nome", "Pergunta", "Resposta", nem sinalizar uma resposta certa
	E clicar no botão Salvar
    Então o sistema sinaliza campo a campo com as mensagens
    Exemplos:
			| NOME             | Preencha este campo                            |
			| PERGUNTA         | Preencha este campo                            |
			| RESPOSTA         | Preencha este campo                            |
			| RESPOSTA CORRETA | Selecionr uma das opções |


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Cadastrar - % de Acerto Mínimo inválido
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando preencher um valor inválido no campo "<% de Acerto Mínimo>"
    	Então o sistema "bloqueia a digitação", ou exibe a mensagem "<Resposta do sistema>" automaticamente ou ao acionar o botão "Salvar"
    	
    Exemplos:
    | % de Acerto Mínimo | Resposta do sistema                                               |
    | teste              | Bloquieia a digitação |
    | 200                | O valor deve ser menor ou igual a 100 |
    | ***//              | Bloquieia a digitação |
    | -10                | O valor deve ser maior ou igual a 0 |





@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Quiz - Cadastrar - Pontos recebidos inválidos
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando preencher um valor inválido no campo "<Pontos Recebidos>"
    	Então o sistema "bloqueia a digitação", ou exibe a mensagem "<Resposta do sistema>" automaticamente ou ao acionar o botão "Salvar"
    Exemplos:
    | Pontos Recebidos| Resposta do sistema                                               |
    | teste         | Bloquieia a digitação  |
    | ***//         | Bloquieia a digitação  |
    | -10           | O valor deve ser maior ou igual a 0 |



@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Quiz - Cadastrar - Máximo de questões inválidos
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando preencher um valor inválido no campo "<Máximo de Questões>"
    	Então o sistema "bloqueia a digitação", ou exibe a mensagem "<Resposta do sistema>" automaticamente ou ao acionar o botão "Salvar"
    Exemplos:
    | Máximo de Questões | Resposta do sistema                                               |
    | teste         | Bloquieia a digitação  |
    | ***//         | Bloquieia a digitação  |
    | -10           | O valor deve ser maior ou igual a 1 |


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Mais de 1 resposta certa na pergunta
	Dado que o admin está na tela de cadastro do Quiz
	Quando for informado todos os campos 
	E escolher outra resposta como correta 
	Então o sistema retira a seleção da resposta anteior e aciona a nova seleção como correta


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Alterar o nome do Quiz antes de Salvar
	Dado que o admin está na tela de cadastro do Quiz
	Quando for informado todos os campos 
	E já escolheu uma resposta como correta 
	E alterou o nome do quiz antes de salvar
	Então ao salvar, o sistema grava o quiz com o nome alterado

@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Alterar uma pergunta antes de Salvar
	Dado que o admin está na tela de cadastro do Quiz
	Quando for informado todos os campos 
	E já escolheu uma resposta como correta 
	E alterou uma pergunta antes de Salvar
	Então ao salvar, o sistema grava o quiz com a pergunta que foi alterada

@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Alterar uma resposta antes de Salvar
	Dado que o admin está na tela de cadastro do Quiz
	Quando for informado todos os campos 
	E já escolheu uma resposta como correta 
	E alterou uma a descrição de uma resposta antes de Salvar
	Então ao salvar, o sistema grava o quiz com a resposta que foi alterada


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Excluir pergunta 
	Dado que o admin está na tela de cadastro do Quiz
	Quando for informado todos os campos 
	E houver mais de uma pergunta
	E excluir uma pergunta antes de Salvar
	Então ao salvar, o sistema grava o quiz sem a pergunta que foi excluída


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Excluir resposta
	Dado que o admin está na tela de cadastro do Quiz
	Quando for informado todos os campos 
	E houver mais de duas respostas
	E excluir uma das respostas (da tercerira em diante) antes de Salvar
	Então ao salvar, o sistema grava o quiz sem a pergunta que foi excluída


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastro completo e válido
	Dado que o admin acessou a tela de Quiz
	Quando clicar no botão "Cadastrar"
	Então o sistema redireciona o admin para o formulário de Cadastro de Quiz
	E preencheu o nome do quiz
	E preencheu o campo "% mínima de acerto"
	E preencheu o campo "Pontos recebidos"
	E preencheu o campo "Máximo de questões"
	E acionou o botão "Adicionar Pergunta"
	E preencheu o campo "Pergunta"
	E preencheu o campo "Resposta"
	E marcou o campo "Correta"
	E preencheu o campo "Resposta"
	Quando acionou o botão "Salvar"
	Então o sistema exibe o modal "Quiz criado com sucesso!"
	E redireciona o admin para a listagem de Quizzes
	Então o quiz está sendo demonstrado na listagem de quizzes

@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Alterar o nome do Quiz já salvo
	Dado que já existem quizzes cadastrados
	Quando o admin clicar no botão "Ações > Alterar" 
	Então o admin será redirecionado para a tela "Edição de Quiz" 
	Quando o admin alterar o nome do quiz
	Então ao salvar, o sistema grava o quiz com o nome alterado

@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Alterar uma pergunta do quiz já salvo
	Dado que já existem quizzes cadastrados
	Quando o admin clicar no botão "Ações > Alterar" 
	Então o admin será redirecionado para a tela "Edição de Quiz" 
	Quando o admin a descrição de uma pergunta do quiz
	Então ao salvar, o sistema grava o quiz com a pergunta alterada

@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Cadastrar - Alterar uma resposta do quiz já salvo
	Dado que já existem quizzes cadastrados
	Quando o admin clicar no botão "Ações > Alterar" 
	Então o admin será redirecionado para a tela "Edição de Quiz" 
	Quando o admin a descrição de uma resposta do quiz
	Então ao salvar, o sistema grava o quiz com a resposta alterada


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Edição - % de Acerto Mínimo Válido
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando editar um quiz e inserir um valor válido no campo "<% de Acerto Mínimo>"
    	E acionar o botão "Salvar"
    	Então o sistema exibe o modal "Treinamento salvo com sucesso!"
    	E o admin é redirecionado para a listagem de "Treinamentos"
    	Quando o admin acionar o botão "Ações / Alterar" do respectivo treinamento
    	Então os novos dados serão visalizados
    	
    Exemplo:
    | Dado atual         | Dado novo | Resposta do sistema           |
    | 10                 | 20        | Subcreve o % de Acerto Mínimo |



@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Edição - % de Acerto Mínimo Inválido
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando editar um quiz e inserir um valor Inválido no campo "<% de Acerto Mínimo>"
    	E acionar o botão "Salvar"
    	Então o sistema "bloqueia a digitação", ou exibe a mensagem "<Resposta do sistema>" automaticamente ou ao acionar o botão "Salvar"
    	
    Exemplos:
    | Dado atual| Dado novo          | Resposta do sistema                   |
    | 10        | teste              | Bloqueia a digitação                  |
    | 10        | 200                | O valor deve ser menor ou igual a 100 |
    | 10        | ***//              | Bloquieia a digitação                 |
    | 10        | -10                | O valor deve ser maior ou igual a 0   |





@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Edição - Pontos recebidos Válidos
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando editar um quiz e inserir um valor válido no campo "<Pontos Recebidos>"
    	E acionar o botão "Salvar"
    	Então o sistema exibe o modal "Treinamento salvo com sucesso!"
    	E o admin é redirecionado para a listagem de "Treinamentos"
    	Quando o admin acionar o botão "Ações / Alterar" do respectivo treinamento
    	Então os novos dados serão visualizados
    	
    Exemplo:
    | Dado atual         | Dado novo | Resposta do sistema           |
    | 10                 | 20        | Subcreve os Pontos Recebidos  |



@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Edição - Pontos recebidos Inválido
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando editar um quiz e inserir um valor Inválido no campo "<Pontos Recebidos>"
    	E acionar o botão "Salvar"
    	Então o sistema "bloqueia a digitação", ou exibe a mensagem "<Resposta do sistema>" automaticamente ou ao acionar o botão "Salvar"
    	
    Exemplos:
    | Dado atual| Dado novo          | Resposta do sistema                   |
    | 10        | teste              | Bloqueia a digitação                  |
    | 10        | 200                | O valor deve ser menor ou igual a 100 |
    | 10        | ***//              | Bloqueia a digitação                  |
    | 10        | -10                | O valor deve ser maior ou igual a 0   |



@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Edição - Máximo de questões Válido
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando editar um quiz e inserir um valor válido no campo "<Máximo de Questões>"
    	E acionar o botão "Salvar"
    	Então o sistema exibe o modal "Treinamento salvo com sucesso!"
    	E o admin é redirecionado para a listagem de "Treinamentos"
    	Quando o admin acionar o botão "Ações / Alterar" do respectivo treinamento
    	Então os novos dados serão visualizados
    	
    Exemplos:
    | Dado atual         | Dado novo | Resposta do sistema           |
    | 10                 | 20        | Subcreve o Máximo de Questões |



@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Quiz - Edição - Máximo de questões Inválido
	Dado que o admin acessou a tela de cadastro de Quiz
	Quando editar um quiz e inserir um valor Inválido no campo "<Máximo de Questões>"
    	E acionar o botão "Salvar"
    	Então o sistema "bloqueia a digitação", ou exibe a mensagem "<Resposta do sistema>" automaticamente ou ao acionar o botão "Salvar"
    	
    Exemplos:
    | Dado atual| Dado novo          | Resposta do sistema                   |
    | 10        | teste              | Bloqueia a digitação                  |
    | 10        | ***//              | Bloqueia a digitação                  |
    | 10        | -10                | O valor deve ser maior ou igual a 1   |


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Quiz - Edição - Quiz já executado
	Dado que já existem quizzes cadastrados e já executados pelo banking
	Quando o admin clicar no botão "Ações > Alterar" em um quiz já executado pelo banking
	Então o admin será redirecionado para a tela "Edição de Quiz" 
	E todas as perguntas e respostas estarão desabilitadas para a edição
	E no rodapé é apresentada a informação "Não é possível editar um quiz já executado".