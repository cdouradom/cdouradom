#language: pt

Funcionalidade: Meus Dados

@manual
@manual-result:failed
@manual-last-tested:23/05/2022
@manual-test-evidence:assets/Error_Acessar_MeusDados_Incenticard.mp4
Cenário: Meus Dados - Acessar
[Ver fluxo](assets/Acessar_MeusDados_Incenticard.gif)
    Dado o usuário estar logado, navegando pelo site "Incenticard"
    Quando o usuário aciona o botão com nome do usuário "Olá, Alexandre"
    E clica na opção "Meus Dados"
    Então o sistema renderiza para tela "Meus Dados"
    Então o usuário pode atualizar os dados

@manual
@manual-result:success
Cenário: Meus Dados - Layout 
[Ver imagem](assets/LayoutMeusDados.png)
    Dado o usuário estar na tela "Meus Dados"
    Quando o usuário visualiza todos os elementos da tela 
    Então os elementos da tela estão alinhado corretamente 

@manual
@manual-result:failed
@manual-last-tested:23/05/2022
@manual-test-evidence:assets/Error_Atualizar_Meus_Dados.mp4
Cenário: Atualizar Meus Dados
[Ver fluxo](assets/Atualizar_Meus_Dados.mp4)
    Dado o usuário estar na tela "Meus Dados"
    Quando o usuário atualiza um dos valores nos seguintes campos
            | Campos      | valores            | Valores atualizados |
            | E-mail      | testeee@gamail.com | testewang@gmail.com |
            | Celular     | (88) 88888-8777    | (12) 12121-2121     |
            | Gênero      | Masculino          | Feminino            |
            | CEP         | 18.685-670         | 18.680-640          |
            | Estado      | SP                 | SP                  |
            | Cidade      | Lençois Paulista   | Lençois Paulista    |
            | Bairro      | Jardim das Nações  | Jardim Cruzeiro     |
            | Endereço    | Rua Colômbia       | Rua Pará            |
            | Número      | 12                 | 325                 |
            | Complemento | casa               | casa                |
    E clica no botão "Atualizar Meus Dados"
    Então o sistema atualiza os "Meus Dados"
    E exibe uma mensagem informando "Dados atualizados com sucesso!"

@manual
@manual-result:success
Esquema do Cenário: Atualizar Meus Dados com valores inválidos
[Ver fluxo](assets/Atualizar_Meus_Dados_com_valores_inválidos.gif)
    Dado o usuário estar na tela "Meus Dados"
    Quando o usuário preenche os campos com valores inválidos "<E-mail>", "<Celular>" e "<Cep>"
    E clica no botão "Atualizar Meus Dados"
    Então o sistema retorna "<Resposta do sistema>"
    Exemplos:
            | E-mail            | Celular         | Cep        | Resposta do Sistema                                                                                                                                       |
            | iiiiiiiiii        | (18) 88887-7777 | 18666666   | Dados atualizados com sucesso! ou o sistema sinaliza para preencher os outros campos com valores "Estado, Bairro, Cidade, Endereço, Número e Complemento" |
            | mileide@gamil.com | (22) 22222-2222 | 18666666   | o celular informado já está cadastrado na base de dados(01). Favor,entrar em contato com a nossa central de atendimento                                   |
            | mileide@gmail.com | (18) 88877-7777 | 33333333   | Dados atualizados com sucesso!                                                                                                                            |
            | @                 | (12) 69555-5665 | 18.680-640 | Dados atualizados com sucesso!                                                                                                                            |
            | Ab@@              | (12) 69555-5665 | 18.680-640 | Dados atualizados com sucesso!                                                                                                                            |
            | @12               | (12) 69555-5665 | 18.680-640 | Dados atualizados com sucesso!                                                                                                                            |
            | Teste@gmail.com   | (12)            | 18.680-640 | O número de celular deve ter 11 dígitos.                                                                                                                  |

Esquema do Cenário: *Atualizar Meus Dados com valores inválidos*
    Dado o usuário estar na tela "Meus Dados"
    Quando o usuário preenche os campos com valores inválidos "<E-mail>", "<Celular>" e "<Cep>"
    E clica no botão "Atualizar Meus Dados"
    Então o sistema retorna "<Resposta do sistema>"
    Exemplos:
            | E-mail            | Celular         | Cep        | Resposta do Sistema                                                                                                     |
            | iiiiiiiiii        | (18) 88887-7777 | 18666666   | o sistema exibe um alerta com a mensagem "Inclua um "@" no endereço de e-mail. "o" está com um "@" faltando."           |
            | mileide@gamil.com | (22) 22222-2222 | 18666666   | o celular informado já está cadastrado na base de dados(01). Favor,entrar em contato com a nossa central de atendimento |
            | mileide@gmail.com | (18) 88877-7777 | 33333333   | Dados inválidos                                                                                                         |
            | @                 | (12) 69555-5665 | 18.680-640 | o sistema exibe um alerta com a mensagem "Inclua uma parte antes e depois de "@". "@" está incompleto"                  |
            | Ab@@              | (12) 69555-5665 | 18.680-640 | o sistema exibe um alerta com a mensagem "A parte depois de "@". Não deve conter o simbolo "@"                          |
            | @12               | (12) 69555-5665 | 18.680-640 | o sistema exibe um alerta com a mensagem "Inclua uma parte antes de "@". "@12" está incompleto"                         |
            | Teste@gmail.com   | (12)            | 18.680-640 | o número de celular deve ter 11 dígitos.                                                                                |

@manual
@manual-result:success
Esquema do Cenário: Atualizar Meus Dados com valores não preenchidos
[Ver fluxo](assets/Atualizar_Meus_Dados_com_valores_não_preenchidos.gif)
    Dados o usuário estar na tela "Meus Dados"
    Quando o usuário não preenche os seguintes campos com valores "<E-mail>","<Celular>" e "<Cep>"
    E clica no botão "Atualizar Meus Dados"
    Então o sistema retorna uma mensagem informando "Preencha este campo"
    Exemplos:
            | E-mail             | Celular      | Cep      |
            |                    | (18)88877777 | 18666666 |
            | mileide@gamail.com |              | 18666666 |
            | mileide@gmail.com  | (18)88877777 |          |
            |                    |              |          |

@manual
@manual-result:failed
@manual-last-tested:23/05/2022
@manual-test-evidence:assets/ERROR_Atualizar_Meus_Dados-Validar_CEP.mp4
Esquema do Cenário: Atualizar Meus Dados - Validar CEP
[Ver fluxo](assets/Atualizar_Meus_Dados-Validar_CEP.gif)
    Dado o usuário estar na tela "Meus Dados"
    Quando o usuário preenche o campo "<Cep>" com valores
    Então o sistema renderiza "buscando" o complemento do endereço preenchido
    E válida o Cep, complementando o endereço nos campos "<Estado>","<Cidade>","<Bairro>" e "<Endereço>"
    Exemplos:
            | Cep      | Estado | Cidade         | Bairro         | Endereço                            |
            | 02860001 | SP     | São Paulo      | Vila Souza     | Avenida deputado cantídio Sampaio   |
            | 78896013 | MT     | Sorriso        | Centro-Sul     | Rua Mato Grosso                     |
            | 22050002 | RJ     | Rio de Janeiro | Copacabana     | Avenida Nossa Senhora de Copacabana |
            | 89211300 | SC     | Joinville      | Floresta       | Tua Santa Catarina                  |
            | 36512000 | MG     | Tocantins      | Não encontrado | Não encontrado                      |

@manual
@manual-result:success
Cenário: Atualizar Meus Dados - Validar Filtro de Busca de Estado/Cidade
    Dado o usuário preenche o campo "Cep" com valores
    E o sistema renderiza complementando o endereço nos campos "Estado","Cidade","Bairro" e "Endereço"
    Quando o usuário verifica se os dados que foram complementados estão corretos
    Então o filtro do sistema é validado



