#language: pt

Funcionalidade: Logar no Site Icenticard

@manual
@manual-result:success
Cenário: Login - Acessar
[Ver fluxo](assets/Login-Acessar.gif)
    Dado o usuário estar navegando na "Área Institucional" do Incenticard 
    Quando usuário aciona o botão "Minha Conta"
    Então o sistema exibe a tela para "Login"

@manual
@manual-result:success
Cenário: Login - Trocar para Cartão Corporativo
[Ver fluxo](assets/Login-Trocar_para_Cartão_Corporativo.gif)
    Dado o usuário na área de "Login - Pessoa Física"
    E visualizou a mensagem "SEU CARTÃO É CORPORATIVO?"
    Quando o usuário clica em "clique aqui para fazer o login com seu E-MAIL e SENHA"
    Então o sistema exibe a tela de "Login - Cartão Corporativo"

@manual
@manual-result:success
Cenário: Login - Trocar para Cartão Pessoa Física
[Ver fluxo](assets/Login-Trocar_para_Cartão_Pessoa_Física.gif)
    Dado o usuário na área de "Login - Cartão Corporativo"
    E visualizou a mensagem "SEU CARTÃO NÃO É CORPORATIVO?"
    Quando o usuário clica em "clique aqui para fazer o login com seu CPF e SENHA"
    Então o sistema exibe a tela de "Login - Pessoa Física"

@manual
@manual-result:success
Cenário: Logar - Pessoa Física 
[Ver fluxo](assets/Logar-Pessoa_Física.gif)
    Dado o usuário estar na tela "Login - Cartão Pessoa Física"
    Quando o usuário preenche os seguintes campos com valores
            | CPF            | SENHA |
            | 006.296.629-40 | ****  |
    E aciona o botão "Entrar"
    Então o "Login" é efetuado com sucesso
    E o sistema exibe a tela "Meus Cartões"

@manual
@manual-result:success
Cenário: Logar com valores inválidos - Pessoa Física 
[Ver fluxo](assets/Logar_com_valores_invalidos.PessoaFisicagif)
    Dado usuário estar na tela "Login - Cartão Pessoa Física"
    Quando o usuário preenche os seguintes campos com valores Inválidos
            | CPF         | SENHA   |
            | mmmmmm2     | ******* |
            | ddddddddddd | ******  |
            | 123456766   | ***     |
    E aciona o botão "Entrar"
    Então o sistema retorna uma mensagem informando "Usuário ou Senha inválidos"

@manual
@manual-result:success
Cenário: Logar com valores não preenchidos - Pessoa Física 
[Ver fluxo](assets/Logarcomvaloresnãopreenchidos-Pessoa_Física.gif)
    Dado usuário estar na tela "Login - Cartão Pessoa Física"
    Quando o usuário não preenche os seguintes campos com valores 
            | CPF     | SENHA   |
            | 1233421 |         |
            |         | ******* |
            |       ¨ |  ¨      |
    E aciona o botão "Entrar"
    Então o sistema sinaliza retornando a mensagem "Preencha este campo"

@manual
@manual-result:success
Cenário: Logar - Corporativo 
    Dado o usuário estar na tela de "Login - Cartão Corporativo"
    Quando o usuário preenche os seguintes campos com valores
            | Email Corporativo    | Senha  |
            | mileide@gmail.com.br | *****  |
    E aciona o botão "Entrar"
    Então o "Login" é efetuado com sucesso
    E o sistema exibe a tela "Meus Cartões"

@manual
@manual-result:success
Cenário: Logar com valores inválidos - Corporativo 
[Ver fluxo](assets/Logarcomvalores_inválidos-Corporativo.gif)
    Dado usuário estar na tela de "Login - Cartão Corporativo"
    Quando o usuário preenche os campos com valores inválidos "<Email Corporativo>" e "<Senha>"
    E aciona o botão "Entrar"
    Então o sistema retorna a "<Mensagem>"
    Exemplos:
            | Email Corporativo   | Senha  | Mensagem                                                              |
            | mi.com              | ****** | Inclua um "@" no endereço de e-mail "mi.com" está com um "@" faltando |
            | mileide@outlook.com | ****** | Usuário ou Senha inválidos                                            |
            | mileide@com.        | ****** | "." Está sendo usada em uma posição incorreta em "com."               |
            | @                   | ****** | Insira uma parte seguida por "@". "@". está incompleto.               |
            | mileide@.com        | ****** | "." Está sendo usado em uma posição incorreta em ".com"               |
            | @@                  | *****  | Insira uma parte seguida por "@". "@@". está incompleto.              |

@manual
@manual-result:success
Cenário: Logar com valores não preenchidos - Corporativo
[Ver fluxo](assets/Logarcomvalores_não_preenchidos-Corporativo.gif) 
    Dado usuário estar na tela de "Login - Cartão Corporativo"
    Quando o usuário não preenche os seguintes campos com valores 
    E aciona o botão "Entrar"
    Então o sistema sinaliza retornando a mensagem "Preencha este campo"
    Exemplos:
            | Email Corporativo | Senha   |
            | mileide@gmail.com |         |
            |                   | ******* |
            |            ¨      |    ¨    |

@manual
@manual-result:success
Cenário: Desconectar da Página
[Ver fluxo](assets/Desconectar_da_Página.gif)
    Dado o usuário "logado" no site Incenticard
    Quando o usuário clica em "Olá, RAFAELA"
    E aciona o botão "Sair"
    Então o sistema desloga da página, voltando para a tela "Área Institucional"
