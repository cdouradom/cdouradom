#language: pt

Funcionalidade: Banking Execução Treinamentos 
Como usuário do banking
Quero executar os treinamentos
Para receber as pontuações e imprimir o certificado, caso estejam configurados para esta finalidade


 account_subcampaign_training_participant
 training_module_execution

-----

Critérios de Aceitação:
Na execução, a trilha é disponibilizada somente quando há dois ou mais módulos cadastrados. 
O "% concluído" é incrementado somente quando cada módulo do treinamento é finalizado
Na execução da trilha, o avatar do usuário é demonstrado somente no módulo que está sendo executado, e somente quando o treinamento ainda não foi 100% finalizado
Para o treinamento que já foi 100% finalizado, o avatar do usuário não é mais demonstrado nos módulos da trilha
Os pontos somente são atribuídos na primeira execução do módulo
Os pontos somente serão atribuídos quando o usuário atingir o "% Mínima de Acerto" configurado no Quiz e se o quiz possuir valor no campo "Pontos Recebidos" (configurados na plataforma pelo admin)
Na execução, a quantidade de questões demonstradas deve respeitar a configuração realizada no cadastro do quiz, campo "Máximo de Questões" (configurado na plataforma pelo admin)



---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Acessar um treinamento
    Dado que o usuário está na listagem de "Treinamentos"
    Quando clicar "Entrar" de um "Treinamento"
    Então o sistema redireciona o usuário para a trilha deste "Treinamento"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Banking Treinamentos - Trilha com mais de um módulo- Layout
    Dado que o usuário está na tela "Treinamentos"
    Quando o acionar o botão "Entrar" de determinado treinamento que possui mais de um módulo
    Então os elementos da tela estão alinhados corretamente contendo as informações abaixo
            | Cabeçalho | Botão "Voltar", Thum do treinamento                                                                                                                                     |
            | Título    | Nome do Treinamento                                                                                                                                                     |
            | Trilha    | Thumbs de cada módulo; Tip com a descrição do módulo (ao posicionar o mouse sobre a thumb) e a informação "Clique sobre o ícone para iniciar esta etapa de treinamento" |

    #Tipo do Módulo ou Quiz, Perguntas, e Botões em negrito
    #Título e respostas sem negrito


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Banking Treinamentos - Trilha com apenas um módulo- Layout
    Dado que o usuário está na tela "Treinamentos"
    Quando o acionar o botão "Entrar" de determinado treinamento que possui apenas um módulo
    Então os elementos da tela estão alinhados corretamente contendo as informações abaixo
            | Título                              | Nome do treinamento                                     |
            | Módulo                              | Exibição do módulo (Material de Leitura, Vídeo ou Quiz) |
            | Botões (quando material de leitura) | Voltar / Finalizar                                      |
            | Botões (quando Vídeo)               | Voltar / Finalizar                                      |
            | Botões (quando Quiz)                | Próxima                                                 |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Ordem dos módulos na excecução do treinamento
    Dado que o usuário está na tela "Treinamentos"
    E acionou o botão "Entrar" de determinado treinamento que possui mais de um módulo
    Quando o usuário visualizar os módulos
    Então eles estarão dispostos na ordem em que foram cadastrados ma plataforma pelo admin


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Treinamento sem nenhuma execução - Primeiro Módulo Habilitado
    Dado que o usuário está na tela "Treinamentos"
    E acionou o botão "Entrar" de determinado treinamento que possui mais de um módulo mas ainda sem nenhuma execução
    Quando o usuário visualizar os módulos
    Então apenas o primeiro módulo da trilha estará habilitado para ser acionado
    E os demais módulos ainda estarão desabilitados para serem acionados


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Treinamento com execução - Módulos Habilitados
    Dado que o usuário está na tela "Treinamentos"
    E acionou o botão "Entrar" de determinado treinamento que possui pelo menos três Módulos mas ainda sem nenhuma execução
    Quando o usuário visualizar os módulos
    Então apenas o primeiro módulo da trilha estará habilitado para ser acionado
    E os demais módulos ainda estarão desabilitados para serem acionados
    Quando o usuário executar o primeiro Módulo
    E voltar para a visualização da trilha
    Então o primeiro e o segundo módulos estarão habilitados
    E o terceiro módulo continuará desabilidado até que o segundo módulo seja executado


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Avançar vídeo antes do tempo
    Dado que o usuário está executando o treinamento
    E o módulo é um vídeo
    Quando o usuário acionar o botão "Próximo" antes do tempo do vídeo terminar
    Então o sistema impede o avanço
    E o botão "Próximo" permanece desabilitado até terminar o tempo do vídeo


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Avançar vídeo após o tempo
    Dado que o usuário está executando o treinamento
    E o módulo é um vídeo
    Quando o usuário aciona o botão "Próximo"
    E o tempo do vídeo já terminou
    Então o sistema avança para o próximo passo


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Transição entre os módulos
    Dado que o usuário está executando o treinamento
    Quando clicar nos botões "Próximo" e "Anterior"
    Então o sistema segue e volta entre os passos do treinamento   


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Quiz com pergunas randômicas
    Dado que o usuário está executando o treinamento
    E o quiz possui 10 perguntas cadastradas no admin
    E possui configuração de "Máximo de Perguntas" = 5
    Quando o usuário executar o quiz
    Então o sistema elenca até 5 perguntas de forma randômica
    E todas as respostas de cada pergunta


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Quiz avançar sem responder
    Dado que o usuário está executando um quiz em um treinamento
    Quando não selecionar uma resposta
    E acionar o botão "Próxima"
    Então o sistema não avança
    E exibe um modal de "Atenção" com a mensagem "Responda a questão antes de prosseguir"
    E ao fechar o modal
    Então a pergunta continuará na tela aguardando o usuário respondê-la


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Banking Treinamentos - Quiz voltar (anterior) sem responder
    Dado que o usuário está executando um quiz que possui pelo menos duas perguntas
    E responder a primeira pergunta
    E acionar o botão "Próxima"
    Então o sistema avança para a próxima pergunta
    Quando o usuário acionar o botão "Anterior" sem responder a segunda pergunta
    Então o sistema exibe um modal de "Atenção" com a mensagem "Responda a questão antes de prosseguir"
    E ao fechar o modal
    Então a pergunta continuará na tela aguardando o usuário respondê-la


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Banking Treinamentos - Resultado do Quiz sem atingir % míninmo e sem certificado
    Dado que o usuário está executando um quiz configurado com quatro perguntas e com "% Mínima de Acerto" = 50%
    E respondeu todas as perguntas do Quiz
    E acertou apenas uma resposta
    Quando acionar o botão avançar no último passo do treinamento
    Então o sistema exibe o resultado do treinamento
    Mas sem o certificado pois o usuário não atingiu o % mínimo cadastrado pelo admin neste treinamento
    E os elementos da tela estão alinhados corretamente
            | Região "Seu Desempenho" | Percentual de acerto                                                                    |
            | Região "Seu Desempenho" | Texto informativo: "Você não atingiu a quantidade mínima de acertos. Tente novamente!"" |
            | Região "Seu Desempenho" | Botões: "Refazer o Quiz" e "Finalizar                                                   |
            | Região "Gabarito"       | Perguntas corretas em "Verde" e Perguntas erradas em "Vermelho"                         |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Banking Treinamentos - Resultado do Quiz atingindo % míninmo - Com Certificado
    Dado que o usuário está executando um quiz configurado com quatro perguntas e com "% Mínima de Acerto" = 50%
    E respondeu todas as perguntas do Quiz
    E acertou duas ou mais respostas
    Quando acionar o botão avançar no último passo do treinamento
    Então o sistema exibe o resultado do treinamento
    E os elementos da tela estão alinhados corretamente
            | Região "Seu Desempenho" | Percentual de acerto                                                                                                                |
            | Região "Seu Desempenho" | Texto informativo: "Parabéns! Você atingiu o percentual mínimo de acertos para este quiz e está elegível para receber a pontuação"" |
            | Região "Seu Desempenho" | Botão:"Finalizar"                                                                                                                   |
            | Região "Gabarito"       | Perguntas corretas em "Verde" e Perguntas erradas em "Vermelho"                                                                     |
    Quando acionar o botão "Finalizar"
    Então ocorre o direcionamento para a tela do download do certificado
    E os elementos da tela estão alinhados corretamente
            | Texto informativo | "Parabéns! Você concluiu o treinamento "X" (nome do treinamento). Acesse a home de treinamentos disponíveis para descobrir novas possibilidades de aprendizado ou refazer este treinamento quantas vezes quiser" |
            | Botões            | "Voltar ao meu Perfil" e "Baixar Certificado"                                                                                                                                                                    |
    Quando o usuário clicar no botão "Baixar Certificado"
    Então o certificado será gerado em uma nova aba do navegador
    E conterá o layout e texto definidos em escopo 
    Quando o usuário voltar para a tela do sistema
    E acionar o botão "Voltar ao meu Perfil"
    Então ocorre o direcionamento para a tela "Treinamentos"
    E o treinamento que foi executado possui a informação de progresso = "100% Concluído"
    E no rodapé da página constará a região "Certificados"
    E os elementos da tela estarão alinhados corretamente
            | Informações | Ícone de certificado (região superior esquerda) |
            | Thumb       | Thumb com a imagem do treinamento               |
            | Botões      | "Baixar Certificado" e "Todos os Certificados"  |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Banking Treinamentos - Resultado do Quiz atingindo % míninmo - Sem Certificado configurado
    Dado que o usuário está executando um quiz configurado com quatro perguntas e com "% Mínima de Acerto" = 50%
    E este treinamento não possui configuração de Certificado
    E respondeu todas as perguntas do Quiz
    E acertou duas ou mais respostas
    Quando acionar o botão avançar no último passo do treinamento
    Então o sistema exibe o resultado do treinamento
    E os elementos da tela estão alinhados corretamente
            | Região "Seu Desempenho" | Percentual de acerto                                                                                                                |
            | Região "Seu Desempenho" | Texto informativo: "Parabéns! Você atingiu o percentual mínimo de acertos para este quiz e está elegível para receber a pontuação"" |
            | Região "Seu Desempenho" | Botão:"Finalizar"                                                                                                                   |
            | Região "Gabarito"       | Perguntas corretas em "Verde" e Perguntas erradas em "Vermelho"                                                                     |
    Quando acionar o botão "Finalizar"
    Então ocorre o direcionamento para a tela do download do certificado
    E os elementos da tela estão alinhados corretamente
            | Texto informativo | "Parabéns! Você concluiu o treinamento "X" (nome do treinamento). Acesse a home de treinamentos disponíveis para descobrir novas possibilidades de aprendizado ou refazer este treinamento quantas vezes quiser" |
            | Botões            | "Voltar ao meu Perfil"                                                                                                                                                                   |
    Quando o usuário clicar no botão "Voltar ao meu Perfil"
    Então ocorre o direcionamento para a tela "Treinamentos"
    E o treinamento que foi executado possui a informação de progresso = "100% Concluído"
    E no rodapé da página constará a região "Certificados"
    E não haverá nenhum certificado disponível para este treinamento