#language: pt

Funcionalidade: Alterar senha de acesso do site

*Dica: Alterar senha com valores inválidos* o campo deveria ter limite de caracteres, não faz sentido uma senha de site liberar 275 ou mais caracteres.

Obs* deu falha nesse cenário: Alterar senha com valores inválidos, acontece que o sistema não exibe nenhuma mensagem e renderiza a tela simulando que a senha do site foi alterada, porém não foi

@manual
@manual-result:success
Cenário: Alterar senha do site - Acessar
[Ver fluxo](assets/Alterarsenhadosite-Acessar.gif)
    Dado o usuário estar logado no site
    Quando o usuário aciona o botão "Olá, Alexandre"
    E clica no botão "Alterar Senha do Site"
    Então o sistema exibe a tela "Alterar Senha de Acesso ao Site"

@manual
@manual-result:success
Cenário: Alterar senha do site
[Ver fluxo](assets/Alterarsenhadosite.gif)
    Dado o usuário estar na tela "Alterar Senha de Acesso ao Site"
    Quando o usuário preenche os seguintes campos com valores 
            | Digite sua senha atual | Nova senha | Confirmar nova senha |
            | *****                  | *******    | *******              |
    E clica no botão "Alterar Senha"
    Então o sistema "altera" a senha 
    E volta para a "Área Institucional"
    Então o usuário pode fazer "login" com a nova senha 

@manual
@manual-result:failed
@manual-last-tested:19/05/2022
@manual-test-evidence:assets/ERROR_Alterarsenhacomvaloresinválidos.gif
Esquema do Cenário: Alterar senha com valores inválidos 
[Ver fluxo](assets/Alterarsenhacomvaloresinválidos.gif)
    Dado o usuário estar na tela "Alterar Senha de Acesso ao Site"
    Quando o usuário preenche os campos com valores inválidos "<Digite sua senha atual>", "<Nova senha>" e "<Confirmar nova senha>"
    Então o sistema retorna "<Resposta do sistema>"
    Quando o usuário insiste acionando o botão "Alterar Senha"
    Então o sistema sinaliza retornando a mensagem "Verifique os erros antes de prosseguir!"
    Exemplos:
            | Digite sua senha atual | Nova senha                      | Confirmar nova senha            | Resposta do sistema                                                                                                                                                                                                                |
            | mileidE@2              | 123                             | 123                             | o Sistema exibe as mensagens: A senha precisa ter no minimo 8 caracteres; A senha precisa ter pelo menos uma letra maiúscula; A senha precisa ter pelo menos uma letra minúscula; A senha precisa ter 1 caracter especial ex: !#@* |
            | mileidE@2              | 12345678Aa/                     | 87654321Aa/                     | o Sistema exibe a mensagem: As senhas precisam ser iguais, verifique!                                                                                                                                                              |
            | 09091334               | 123456Aa@                       | 123456Aa@                       | o sistema exibe a mensagem: A senha atual informada não está correta. Por favor, verifique e tente novamente.                                                                                                                      |
            | aB@123456              | *Foram adicionados 275 digitos* | *Foram adicionados 275 digitos* | o Sistema não habilita o botão "Alterar Senha"                                                                                                                                                                                     |

@manual
@manual-result:success
Esquema do Cenário: Alterar Senha com valores não preenchidos
[Ver fluxo](assets/AlterarSenhacomvaloresnãopreenchidos.gif)
    Dado o usuário estar na tela "Alterar Acesso da Senha ao Site"
    Quando o usuário não preenche os campos com valores "<Digite sua senha atual>", "<Nova senha>" e "<Confirmar nova senha>"
    E aciona o botão "alterar senha"
    Então o sistema sinaliza retornando a mensagem "Preencha este campo."
    Exemplos:
            | Digite sua senha atual | Nova senha | Confirmar nova senha |
            | *******                |            |                      |
            |                        | *****      |                      |
            |                        |            | ******               |
            |                        |            |                      |

      
