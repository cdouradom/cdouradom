#language: pt

Funcionalidade: Banking Treinamentos
Como usuário do banking
Quero acessar a home de treinamentos que foram cadastrados pelo administrador da plataforma
Para visualizá-los


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Acessar através da home de treinamentos
    Dado que o usuário estava na "home" de "treinamentos"
    Quando aciona o botão "Todos os Treinamentos"
    Então o sistema redireciona o usuário para a tela dos "Treinamentos"


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Acessar através do menu
    Dado que o usuário está logado no banking da campanha
    Quando acionar o menu principal no "hambuguinho"
    Então o sistema lista todos os menus para o usuários
    Quando o usuário acionar o menu "Treinamentos"
    Então o sistema redireciona o usuário para a lista de "Treinamentos"
    Quando o usuário visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Banking Treinamentos - Layout
        Dado que o admin esta logado
	    Quando o admin acessou a tela "Treinamento"
  	    Então os elementos abaixo serão exibidos
            | Título                       | "Treinamentos"                                        |
            | Cabeçalho                    | Avatar, Nome, Pontuação, Finalizados                  |
            | Listagem                     | Thumbs dos Treinamentos, % de Concluído, Botão Entrar |
            | Rodapé                       | Texto informativo: Foram encontrados X resultados     |
            | Rodapé                       | Paginação                                             |
            | Rodapé (Região Certificados) | Ícone de certificado (região superior esquerda)       |
            | Rodapé (Região Certificados) | Thumb com a imagem do treinamento                     |
            | Rodapé (Região Certificados) | Botões "Baixar Certificado" e "Todos os Certificados" |


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Inserir Foto Avatar
    Dado que o usuário está na "home" de "treinamentos"
    E seu avatar está sem Foto
    Quando o usuário fizer upload de uma "Foto" na tela de "Editar Meus Dados"
    Então a foto será exibida no avatar no cabeçalho do banking
    Quando o usuário voltar para a "home" de "treinamentos"
    Então a foto do usuário deverá ser exibida no avatar do usuário que fica na primeira sessão da "home" de "treinamentos"


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Excluir Foto Avatar
    Dado que o usuário está na "home" de "treinamentos"
    E seu avatar já possui foto
    Quando o usuário remover sua foto através da tela de "Editar Meus Dados"
    Então a foto será removida de seu avatar no cabeçalho do banking
    Quando o usuário voltar para a "home" de "treinamentos"
    Então a foto do usuário não será mais exibida no avatar do usuário que fica na primeira sessão da "home" de "treinamentos"


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Alterar Foto Avatar
    Dado que o usuário está na "home" de "treinamentos"
    E seu avatar já possui foto
    Quando o usuário fizer upload de uma nova "Foto" na tela de "Editar Meus Dados"
    Então a nova foto será exibida no avatar no cabeçalho do banking
    Quando o usuário voltar para a "home" de "treinamentos"
    Então a nova foto do usuário deverá ser exibida no avatar do usuário que fica na primeira sessão da "home" de "treinamentos"


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Pontuação
    Dado que o usuário está na "home" de "treinamentos"
    E já executou treinamentos que possuem quizzes com "Pontos Recebidos" configurados
    E atingiu o percentual necessário de acertos para receber a pontuação 
    Quando consultar a região "Pontuação" 
    Então será demomstrada a quantidade de pontos atribuúidos ao usuário


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Treinamentos Finalizados - Sem execuções
    Dado que o usuário está na "home" de "treinamentos"
    E ainda não realizou nenhum treinamento
    Quando consultar seu total no box "treinamentos finalizados" que fica na primeira sessão da "home" de "treinamentos"
    Então seu total será "0", pois o sistema não tem registros para somar desse usuário


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Treinamentos Finalizados - Com execuções
    Dado que o usuário está na "home" de "treinamentos"
    E realizou várias execuções de treinamentos de IDs diferentes
    Quando consultar o total de "Treinamentos Finalizados" que fica na primeira sessão da "home" de "treinamentos"
    Então o número será conforme a quantidade de treinamentos realizados/concluídos, independente de ter ou não atingido o percentual mínimo de acertos
    | Usuários  | Execuções | IDs de Treinamentos | Treinamento Finalizados |
    | Usuário 1 | 10        | 5                   | 5                       |
    | Usuário 2 | 8         | 7                   | 7                       | 
    #fazer essa validação consultando o realtório de treinamentos realizados no admin


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Paginação
Dado que o usuário está na "home" de "Treinamentos"
Quando há mais de 10 treinamentos na listagem
Então no rodapé será demonstrada a Paginação
E ao clicar sobre a numeração das páginas
Então ocorre a transição entre as páginas, sem nenhum erro


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Treinamento Inativado
Dado que o usuário está na "home" de "Treinamentos"
E os treinamentos "Ativos" estão sendo demonstrados 
Quando o admin inativar determinado treinamento na plataforma
E o usuário do banking atualizar a página da "home" de "Treinamentos"
Então o treinamento que foi inativado pelo admin não será mais demonstrado na "home" de "Treinamentos" do banking


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Treinamento Reativado
Dado que o usuário está na "home" de "Treinamentos"
E os treinamentos "Ativos" estão sendo demonstrados 
E na Plataforma (admin) há treinamentos que estão "Inativos"
Quando o admin ativar determinado treinamento na plataforma
E o usuário do banking atualizar a página da "home" de "Treinamentos"
Então o treinamento que foi ativado pelo admin passará a ser demonstrado na "home" de "Treinamentos" do banking


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Home Treinamentos - Alterar Thumb
Dado que o usuário está na "home" de "Treinamentos"
E os treinamentos "Ativos" estão sendo demonstrados 
E o usuário visualiza a imagem "X" da thumb de um determinado treinamento
Quando o admin alterar a imagem da thumb do referido treinamento na plataforma (inserindo a imagem "Y")
Então a imagem da thumb do treinamento será atualizada na plataforma
Quando o usuário do banking atualizar a página da "home" de "Treinamentos"
Então vizualizará a nova imagem "Y" na thumb do referido treinamento




