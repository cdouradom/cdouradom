#language: pt

Funcionalidade: Meus Cartões

Obs: cenário repetido, pendente e com *, é sugestão de melhoria

Não consegui testar os cenários de cartõess virtuais, recuperação de senha (e-mail e celular), envio de senha (e-mail e celular) e Visualizar dados do cartão

Obs: demorou umas 5 horas para o envio de Senha Celular, seria interessante melhorar o tempo

@manual
@manual-result:success
Cenário: Meus Cartões - Acessar 
[Ver fluxo](assets/MeusCartões-Acessar.gif)
       Dado o usuário preencheu os campos do "Login"
       Quando o usuário aciona o botão "Entrar"
       Então o sistema efetua o "login"
       E exibe a tela "Meus Cartões"

@manual
@manual-result:success
Cenário: Meus Cartões - Layout
[Ver imagem](assets/LayoutMeusCartoes.png)
       Dado o usuário estar na tela "Meus Cartões"
       Quando o usuário visualiza todos os elementos da tela 
       Então os elementos da tela estão alinhados corretamente

@manual
@manual-result:success
Cenário: Meus Cartões - Ver cartões vencidos
[Ver fluxo](assets/Meus_Cartões-Ver_cartões_vencidos.gif)
       Dado o usuário estar na tela "Meus Cartões"
       Quando o usuário aciona o botão "Ver cartões vencidos"
       Então o sistema exibe todos os cartões marcados como "vencidos"

@manual
@manual-result:success
Esquema do Cenário: Meus Cartões - Verificar estado dos cartões 
[Ver imagem](assets/MeusCartoes_EstadodosCartoes.png)
       Dado o usuário estar na tela "Meus Cartões"
       Quando o usuário deseja visualizar o "<Estado dos Cartões>"
       Então o sistema exibe a legenda com as "<Cores>", indicado a situação que se encontra o cartão 
       Exemplos:
                     | Estado dos Cartões             | Cores    |
                     | Cartões ativos                 | Branco   |
                     | Cartões bloqueados             | Cinza    |
                     | Cartões próximos do vencimento | Amarelo  |
                     | Cartões vencidos               | Vermelho |

@manual
@manual-result:success
Cenário: Meus Cartões - Visualizar Cartões Físicos 
[Ver fluxo](assets/Meus_Cartões-Visualizar_Cartões_Fisicos.gif)
       Dado o usuário estar na tela "Meus Cartões" na opção "Cartões Virtuais"
       Quando o usuário aciona a opção "Cartões Físicos"
       Então o sistema exibe todos os "Cartões Físicos" que o usuário tem

@manual
@manual-result:success
Cenário: Cartões Físicos - Visualizar Extrato do Cartão
[Ver fluxo](assets/Cartões_Fisicos-Visualizar_Extrato_do_Cartão.gif)
       Dado o usuário estar na tela "Cartões Físicos"
       Quando o usuário aciona o botão "Extrato"
       Então o sistema exibe a tela "EXTRATO DO CARTÃO", mostrando o Status, o Saldo e todas as Movimentações do cartão

@manual
@manual-result:success
Cenário: Cartões Físicos, Extrato - Voltar para Meus Cartões
[Ver fluxo](assets/Cartões_Fisicos,Extrato-Voltar_para_Meus_Cartões.gif)
       Dado o usuário estar na tela "EXTRATO DO CARTÃO"
       Quando o usuário aciona o botão "Voltar para Meus Cartões"
       Então o sistema volta para a tela "Meus Cartões - Cartões Físicos"

@manual
@manual-result:failed
@manual-last-tested:24/05/2022
@manual-test-evidence:assets/CartõesFisicos-Recuperar_SenhaEmailInvalido.gif
Cenário: Cartões Físicos - Recuperar Senha E-mail
[Ver fluxo](assets/Cartões_Físicos-Recuperar_Senha.gif)
       Dado o usuário estar na tela "Cartões Físicos"
       E acionou o botão "Recuperar Senha"
       Quando o usuário seleciona o tipo de envio "E-mail"
                     | Opção   | Opção selecionada |
                     | E-mail  | x                 |
                     | Celular |                   |
       E aciona o botão "Recuperar"
       Então o sistema renderiza a tela
       E exibe a mensagem informando "Solicitação efetuada com sucesso. Verifique seu e-mail"

Cenário: *Cartões Físicos - Recuperar Senha com E-mail inválido*
[Ver fluxo](assets/CartõesFisicos-Recuperar_SenhaEmailInvalido.gif)
       Dado o usuário estar na tela "Cartões Físicos"
       E está com E-mail cadastrado em "Meus Dados" inválido
       E acionou o botão "Recuperar Senha"
       Quando o usuário seleciona o tipo de envio "E-mail"
       E aciona o botão "Recuperar"
       Então o sistema renderiza a tela
       E exibe a mensagem informando "Não foi possivel concluir o processo nesse momento. Verifique se seu E-mail está correto!"

@manual
@manual-result:success
Cenário: Cartões Físicos - Recuperar Senha Celular
[Ver fluxo](assets/CartõesFísicos-Recuperar_Senha_Celular.gif)
       Dado o usuário estar na tela "Cartões Físicos"
       E acionou o botão "Recuperar Senha"
       Quando o usuário seleciona o tipo de envio "Celular"
       E aciona o botão "Recuperar"
       Então o sistema renderiza a tela
       E exibe a mensagem informando "Solicitação efetuada com sucesso. Verifique seu celular"

Cenário: *Cartões Físicos - Recuperar Senha com Número de Celular inválido*
       Dado o usuário estar na tela "Cartões Físicos"
       E está com Número de Celular cadastrado em "Meus Dados" inválido
       E acionou o botão "Recuperar Senha"
       Quando o usuário seleciona o tipo de envio "E-mail"
       E aciona o botão "Recuperar"
       Então o sistema renderiza a tela
       E exibe a mensagem informando "Não foi possivel concluir o processo nesse momento. Verifique se seu Número de Celular está correto!"

@manual
@manual-result:success
Cenário: Cartões Físicos - Envio de Senha E-mail
[Ver imagem](assets/MeusCartõesEnviodeSenha.jpg)
       Dado o usuário fez o processo de "recuperação de senha"
       Quando o usuário entra no E-mail para verificar se chegou o "Envio da Senha"
       Então o envio da senha por E-mail é validado com sucesso

@manual
@manual-result:success
Cenário: Cartões Físicos - Envio de Senha Celular
[Ver imagem](assets/CartõesFísicos-Envio_de_Senha_Celular.jpg)
       Dado o usuário fez o processo de "recuperação de senha"
       Quando o usuário entra no SMS para verificar se chegou o "Envio da Senha"
       Então o envio da senha por SMS é validado com sucesso

@manual
@manual-result:success
Cenário: Cartões Físicos - Bloquear Contactless
[Ver fluxo](assets/Cartões_Físicos-Bloquear_Contactless.gif)
       Dado o usuário estar na tela "Cartões Físicos"
       E acionou o botão "Bloquear Contactless"
       Quando o usuário aciona o botão "Confirmar"
       Então o sistema exibe a mensagem informando "Contactless desativado com sucesso"
       Quando o usuário aciona o botão "x" da mensagem
       Então o sistema renderiza a tela com Contactless já bloqueado

@manual
@manual-result:success
Cenário: Cartões Físicos - Cancelar o Bloquear Contactless
[Ver fluxo](assets/Cartões_Físicos-Cancelar_o_Bloquear_Contactless.gif)
       Dado o usuário estar na tela "Cartões Físicos"
       E acionou o botão "Bloquear Contactless"
       Quando o usuário aciona o botão "Cancelar" e/ou aciona o botão "X"
       Então o sistema cancela a operação

@manual
@manual-result:success
Cenário: Cartões Físicos - Desbloquear Contactless
[Ver fluxo](assets/Cartões_Físicos-Desbloquear_Contactless.gif)
       Dado o usuário estar na tela "Cartões Físicos"
       E acionou o botão "Desbloquear Contactless"
       Quando o usuário aciona o botão "Confirmar"
       Então o sistema exibe a mensagem informando "Contactless ativado com sucesso"
       Quando o usuário aciona o botão "x" da mensagem
       Então o sistema renderiza a tela com Contactless já desbloqueado

@manual
@manual-result:success
Cenário: Cartões Físicos - Cancelar o Desbloquear Contactless
[Ver fluxo](assets/Cartões_Físicos-Cancelar_o_Desbloquear_Contactless.gif)
       Dado o usuário estar na tela "Cartões Físicos"
       E acionou o botão "Desbloquear Contactless"
       Quando o usuário aciona o botão "Cancelar" e/ou aciona o botão "X"
       Então o sistema cancela a operação

@manual
@manual-result:success
Cenário: Meus Cartões - Visualizar Cartões Virtuais 
[Ver fluxo](assets/Meus_Cartões-Visualizar_Cartões_Virtuais.gif)
       Dado o usuário estar na tela "Meus Cartões" na opção "Cartões Físicos"
       Quando o usuário aciona a opção "Cartões Virtuais"
       Então o sistema exibe todos os "Cartões Virtuais" que o usuário tem

@manual
@manual-result:success
Cenário: Cartões Virtuais - Visualizar o extrato do cartão
       Dado o usuário estar na tela "Cartões Virtuais"
       Quando o usuário aciona o botão "Extrato"
       Então o sistema exibe a tela "EXTRATO DO CARTÃO", mostrando o Status, o Saldo e todas as Movimentações do cartão

@manual
@manual-result:success
Cenário: Cartões Virtuais - Recuperar Senha E-mail
       Dado o usuário estar na tela "Cartões Virtuais"
       E acionou o botão "Recuperar Senha"
       Quando o usuário seleciona o tipo de envio "E-mail"
       E aciona o botão "Recuperar"
       Então o sistema renderiza a tela
       E exibe a mensagem informando "Solicitação efetuada com sucesso. Verifique seu e-mail"

@manual
@manual-result:success
Cenário: Cartões Virtuais - Recuperar Senha Celular
       Dado o usuário estar na tela "Cartões Virtuais"
       E acionou o botão "Recuperar Senha"
       Quando o usuário seleciona o tipo de envio "Celular"
       E aciona o botão "Recuperar"
       Então o sistema renderiza a tela
       E exibe a mensagem informando "Solicitação efetuada com sucesso. Verifique seu celular"

@manual
@manual-result:success
Cenário: Cartões Virtuais - Envio de Senha E-mail
       Dado o usuário fez o processo de "recuperação de senha"
       Quando o usuário entra no E-mail para verificar se chegou o "Envio da Senha"
       Então o envio da senha por E-mail é validado com sucesso

@manual
@manual-result:success
Cenário: Cartões Virtuais - Envio de Senha Celular
       Dado o usuário fez o processo de "recuperação de senha"
       Quando o usuário entra no SMS para verificar se chegou o "Envio da Senha"
       Então o envio da senha por SMS é validado com sucesso

@manual
@manual-result:success
Cenário: Cartões Virtuais - Visualizar Dados do cartão 
       Dado o usuário estar na tela "Cartões Virtuais"
       Quando o usuário aciona o botão "Visualizar Dados"
       Então o sistema exibe todos os "Dados" do cartão 

@manual
@manual-result:success
Cenário: Cartões Virtuais - Imprimir Dados do Cartão
[Ver imagem](assets/ImprimirCartao.jpeg)
    Dado o usuário estar na tela "Cartões Virtuais"
    Quando o usuário aciona o botão "IMPRIMIR" 
    Então é exibida a tela "Print" para impressão
    Então o usuário pode imprimir os Dados do Cartão

@manual
@manual-result:success
Cenário: Cartões Virtuais - Copiar Número do Cartão 
[Ver imagem](assets/copiarCartao.jpeg)
     Dado o usuário estar na tela "Cartões Virtuais"
     Quando o usuário aciona o botão de "COPIAR"
     Então o sistema cópia o "Número do Cartão" enviando para área de transferência do celular 
