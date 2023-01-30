#language: pt

Funcionalidade: Área Institucional
Janeiro de 2022
OBS: formulário da central de atendimento não pede o ddd, o da Proposta Comercial
 pede.
- É possivel adicionar letras nos campos "CPF","Telefone"
- O sistema habilita de enviar mensagem com valores invalidos
- Apresentou o seguinte erro no cenário: Reenviar mensagem, apareceu essa mensagem: "Atenção ✕ Recaptcha inválido!"... Validar com Francisco cenário desejado
* Verificar com Francisco as mensagens quando preeencho o formulário com Dados inválidos, pois sistema quase não apresenta mensagens

@manual-result:success
Cenário: Cookies da página Incenticard
[Ver fluxo](assets/CookiesIncenticardAcessar.webm)
    Dado o usuário acessa a internet 
    Quando o usuário entra pela primeira vez na página "https://www.incenticard.com.br/"
    Então o sistema exibe os cookies da página, com hiperlinks em "Consulte a Política de Privacidade" e "Política de Cookies" 
    E disponibiliza o botão "Aceitar" cookies no canto interior da tela

@manual-result:success
Cenário: Área Institucional - Layout 
[Ver imagem](assets/LayoutAcessarAreaInstitucional.png)
    Dado o usuário estar na tela de "Área Institucional" do Incenticard
    Quando o usuário visualiza todos os elementos da tela 
    Então os elementos da tela estão alinhados corretamente

@manual-result:success
Cenário: Sobre a Incenticard - Acessar 
[Ver fluxo](assets/SobreIcenticard-acessar.webm)
    Dado o usuário estar na tela de "Área Institucional" do Incenticard
    Quando o usuário aciona o botão/ou desce a tela em "Sobre a Incenticard"
    Então o sistema exibe as informações da Incenticard
    E disponibiliza o botão "Saiba Mais"

@manual-result:success
Cenário: Sobre a Incenticard - Saiba Mais
[Ver fluxo](assets/SobreaIncenticard-SaibaMais.webm)
    Dado o usuário estar na tela "Sobre a Incenticard"
    Quando o usuário aciona o botão "Saiba Mais"
    Então o sistema exibe a tela "Sobre Nós", que lista mais informações sobre a Incenticard

@manual-result:success
Cenário: Produtos - Acessar
[Ver fluxo](assets/Produtos-Acessar.webm)
    Dado o usuário estar na tela de "Área Institucional" do Incenticard
    Quando o usuário aciona o botão/ou desce a tela em "Produtos"
    Então o sistema exibe todos os "cartões" oferecidos pela Incenticard

@manual-result:success
Cenário: Produtos - Visualizar Modelos  
[Ver fluxo](assets/Produtos-VisualizarModelos.webm)
    Dado o usuário estar na tela "Produtos"
    Quando o usuário posiciona o mouse em cima dos seguintes modelos de cartões    
            | Modelos de Cartão |
            | BLACK             |
            | COMBUSTÍVEL       |
            | FLOW              |
            | CORPORATE         |
    Então sistema mostra o cartão com um overview de informações

@manual-result:success
Cenário: Produtos - Saiba Mais
[Ver fluxo](assets/Produtos-SaibaMais.webm)
    Dado o usuário estar na tela "Produtos"
    E escolheu um modelo de cartão   
    Quando o usuário aciona o botão "Saiba Mais"
    Então o sistema exibe um complemento de informações sobre o cartão 

@manual-result:success
Cenário: Diferenciais - Acessar
[Ver fluxo](assets/Diferenciais-Acessar.webm)
    Dado o usuário estar na tela de "Área Institucional" do Incenticard
    Quando o usuário aciona o botão/ou desce a tela em "Diferenciais"
    Então o sistema exibe os benefícios dos cartões Incentcard
    Quando o usuário posiciona o mouse em cima dos benefícios citados
    Então é exibida uma animação 

@manual-result:success
Cenário: Contato - Acessar 
[Ver fluxo](assets/Contato-Acessar.webm)
    Dado o usuário estar na tela de "Área Institucional" do Incenticard
    Quando o usuário aciona o botão/ou desce a tela em "Contato"
    Então é exibida a tela "Central de Atendimento"
    Então o usuário pode preencher o formulário para contato 

@manual
@manual-result:failed
@manual-last-tested:25/05/2022
@manual-test-evidence:assets/ERROR_CentraldeAtendimento-CopiaeColarDados.gif
Cenário: Central de Atendimento - Copia e Colar Dados
[Ver fluxo](assets/Central_de_Atendimento-CopiaeColar_Dados.gif)
    Dado o usuário estar na tela "Central de Atendimento"
    Quando o usuário cola "valores" preenchendo o formulário
    Então o sistema cola os valores corretamente

@manual-result:success
Cenário: Central de Atendimento - Enviar Mensagem mas não possui o cartão
[Ver fluxo](assets/CentraldeAtendimento-EnviarMensagemmasnãopossuiocartão.webm)
    Dado o usuário estar na tela "Central de Atendimento"
    E preenche os seguintes campos com valores válidos
            | Campo         | Valor            |
            | Nome Completo | Rafaela Testando |
            | CPF           | 714.230.729-36   |
            | E-mail        | 123@gmail.com    |
            | Telefone      | 14559656895      |
    E digita uma mensagem
            | Testando os campos central de atendimento |
    Mas não possui cartão
    Quando o usuário aciona o botão "Enviar Mensagem"
    Então o sistema envia a mensagem
    E renderiza a tela exibindo a seguinte mensagem 
            | Mensagem enviada.                       |
            | Retornamos o contato em breve.          |
            | Obrigado por entrar em contato conosco. |

@manual-result:success
Cenário: Central de Atendimento - Enviar Mensagem e possui o cartão
[Ver fluxo](assets/CentraldeAtendimento-EnviarMensagempossuicartão.webm)
    Dado o usuário estar na tela "Central de Atendimento"
    E preenche os seguintes campos com valores válidos
            | Campo         | Valor          |
            | Nome Completo | Teste          |
            | CPF           | 714.230.729-36 |
            | E-mail        | 123@gmail.com  |
            | Telefone      | 14559656895    |
    E aciona o botão "Já possuo o cartão"
    E preenche os seguintes dados do cartão
            | Dado                              | Valor  |
            | Últimos 6 digitos do nº do cartão | 123456 |
            | Proxy                             | 123    |
    E digita uma mensagem
            | testando com cartão |
    Quando o usuário aciona o botão "Enviar Mensagem"
    Então o sistema envia a mensagem
    E renderiza a tela exibindo a seguinte mensagem 
            | Mensagem enviada.                       |
            | Retornamos o contato em breve.          |
            | Obrigado por entrar em contato conosco. |

@manual
@manual-result:failed
@manual-last-tested:25/05/2022
@manual-test-evidence:assets/CentraldeAtendimento-ReenviarMensagem.webm
Cenário: Central de Atendimento - Reenviar Mensagem
    Dado o usuário estar na tela "Central de Atendimento"
    E já enviou a "Mensagem"
    Quando o usuário aciona o ícone "Recarregar" da página 
    E confirma o reenvio do formulário "Continuar"
    Então o sistema reenvia a "Mensagem" descrita no formulário
    E retorna a confirmação "Mensagem reenviada"

@manual
@manual-result:failed
@manual-last-tested:24/02/2022
@manual-test-evidence:assets/ERROR_Central_de_Atendimento-Enviar_mensagem_dados_inválidos.gif
Esquema do Cenário: Central de Atendimento - Enviar mensagem dados inválidos 
    Dado o usuário estar na tela "Central de Atendimento"
    Quando o usuário preenche os "<Campos>" do formulário com "<Valores>" inválidos 
    Então é exibida a "<Resposta do sistema>"
    Exemplos:
            | Campos                            | Valores | Resposta do sistema                                                                                            |
            | Nome Completo                     | oo      | o sistema exibe um alerta com a mensagem "Insira o nome completo"                                              |
            | CPF                               | 12      | o sistema exibe um alerta com a mensagem "Insira um CPF válido"                                                |
            | E-mail                            | oo      | o sistema exibe um alerta com a mensagem "Inclua um "@" no endereço de e-mail. "oo" está com um "@" faltando." |
            | E-mail                            | oo@     | o sistema exibe um alerta com a mensagem "Inclua uma parte depois de "@". "oo@" está incompleto"               |
            | Telefone                          | 22      | o sistema exibe um alerta com a mensagem "Insira um telefone válido"                                           |
            | Últimos 6 digitos do nº do cartão | 23145   | o sistema exibe um alerta com a mensagem "digito de cartão inválido"                                           |
            | Proxy                             | 2       | o sistema exibe um alerta com a mensagem "Proxy de cartão invalido"                                            |
            | Mensagem                          | i       | o sistema exibe um alerta com a mensagem "não atingiu limite de 20 caracteres"                                 |

@manual-result:success
Esquema do Cenário: Central de Atendimento - Enviar Mensagem sem preencher Formulário
[Ver fluxo](assets/CentraldeAtendimento-Enviar_Mensagem_sem_preencher_Formulário.gif)
    Dado o usuário estar na tela "Central de Atendimento"
    Quando o usuário não "<Preenche>" os "<Campos>" do formulário 
    Então o sistema sinaliza com a mensagem "Preencha este campo."
    Exemplos:
            | Campos                            | Preenche |
            | Nome Completo                     | ㅤ       |
            | CPF                               | ㅤ       |
            | E-mail                            | ㅤ       |
            | Telefone                          | ㅤ       |
            | Últimos 6 digitos do nº do cartão | ㅤ       |
            | Proxy                             | ㅤ       |
            | Mensagem                          | ㅤ       |

@manual
@manual-result:failed
@manual-last-tested:25/04/2022
@manual-test-evidence:assets/CentraldeAtendimenro-íconededúvidadoscampos.webm
Cenário: Central de Atendimento - Já possuo o cartão acionar ícone de dúvida dos campos
    Dado o usuário estar na tela "Central de Atendimento"
    Quando o usuário aciona o ícone "?" em um dos seguintes campos
            | Campos                            |
            | Últimos 6 digitos do nº do cartão |
            | Proxy                             |
    Então é exibida uma tela mostrando as informações sobre o campo escolhido

@manual
@manual-result:success
Cenário: Central de Atendimento - Preencher campo CPF com letras
[Ver fluxo](assets/Central_de_Atendimento-Preencher_campo_CPF_com_letras.gif)
    Dado o usuário estar na tela "Central de Atendimento"
    Quando o usuário preenche o campo "CPF" com a letra "e"
    Então o sistema exibe um alerta com a mensagem "Insira um número"
    E não habilita enviar a mensagem do formulário

@manual
@manual-result:failed
@manual-last-tested:25/02/2022
@manual-test-evidence:assets/ERROR_CentraldeAtendimento-PreenchercampoTelefonecomletras.gif
Cenário: Central de Atendimento - Preencher campo Telefone com letras
    Dado o usuário estar na tela "Central de Atendimento"
    Quando o usuário preenche o campo "Telefone" com letras
    Então o sistema exibe um alerta com a mensagem "Telefone inválido"
    E não habilita enviar a mensagem do formulário

@manual
@manual-result:success
Cenário: Validar Idiomas 
[Ver video](assets/ValidarIdiomas.webm)
    Dado o usuário estar na tela de "Área Institucional" do Incenticard
    Quando o usuário aciona o ícone de "idiomas"
    E seleciona os seguintes Idiomas "Português BR", "Inglês" ou "Espanhol"
    Então o sistema renderiza alterando o idioma da página do "Incenticard"






