#language: pt

Funcionalidade: Banking - Primeiro Acesso
 Como usuário na campanha
 Quero fazer o cadastro da minha conta
 Para acessar o banking

-----

Critérios de Aceitação:
 Não é obrigatório que o CPF seja pré cadastrado na plataforma para realizar a ativação da conta
 O cadastro na campanha passa a ser aberto tbm, mantendo cadastros com a base pré cadastrada já existente
 Ao acessar a opção "Primeiro Acesso" o usuário deve optar entre "Pessoa Física" e "Pessoa Jurídica"
 O formulário de cadastro é composto dos campos: "CPF", "Nome", "Data de nascimento", "E-mail", "Celular", "CEP", "Endereço", "Número", "Complemento", "Bairro", "Estado", "Cidade", "Senha", "Confirmar senha", "Flags: Li e concordo com os Termos da LGPD" e "Concordo e aceito o regulamento da campanha.*", e os botões "Finalizar Cadastro" e "Voltar"
 O email precisa ser reconhecido como tal "xx@xxx.xx"
 Não pode ter duplicidade de email
 Não pode ter duplicidade de Celular
 Não pode ter duplicidade de CPF
 É obrigatório nome com sobrenome
 Precisa ter 18 anos ou mais para ativar a conta
 Deve ser válida no calendário a Data de nascimento informada
 O endereço é preenchido pelo sistema conforme CEP digitado pelo usuário (padrão)
 As senhas precisam ser iguais
 Gênero e Estado Civil não existem no primeiro acesso desta campanha
 Após o cadastro ser finalizado com sucesso, um modal de sucesso é exibido
 
 
---

@manual
@Tarefa_#:
@manual-result: 
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - Layout e Cancelar
        Dado que o usuário acessou a url da campanha na visão do Banking
        Quando o usuário acionar o botão "Primeiro Acesso" 
        Então o sistema redireciona o usuário para a tela "Primeiro Acesso"
        E os elementos da tela estão alinhados corretamente
            | Título            | Primeiro Acesso                                    |
            | Botões            | "Pessoa Físca", "Pessoa Jurídica" e "Voltar"       |
            | Texto Informativo | Texto > Selecione entre pessoa física ou jurídica. |
           
#OBS: Na ocasião do cadastro deste cenário, esta tela ainda não possuía nenhum botão "Voltar" ou "Cancelar". Deve haver, então se for o caso, cadastre um ajuste

# CPF CADASTRADO NA BASE

@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Física - Layout 
        Dado que o usuário acionou o botão "Primeiro Acesso"
        Quando na tela "Primeiro Acesso" acionou o botão "Pessoa Física"
        Então o sistema redirecionou para o formulário de cadastro
        E os campos estão alinhados corretamente conforme os elementos abaixo
            | Região Avatar   | Botão "Imagem" (Clique para selecionar um avatar) e texto informativo "Dimensões recomendadas 100px x 100px até 250KB" |
            | Região Dados    | Campos "CPF", "Nome" e "Data de Nascimento"                                                                            |
            | Região Contato  | Campos "E-mail" e "Celular"                                                                                            |
            | Região Endereço | Campos "CEP", "Endereço", "Número", "Complemento", "Bairro", "Estado" e "Cidade"                                       |
            | Região Senha    | Campos "Senha" e "Confirmar Senha"                                                                                     |
            | Rodapé          | Checkbox "Concordo e aceito o termo de consentimento da LGPD.*" e "Concordo e aceito o regulamento da campanha.*"      |
            | Rodapé          | Botões "Voltar" e "Finalizar Cadastro"                                                                                 |


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Jurídica - Layout 
        Dado que o usuário acionou o botão "Primeiro Acesso"
        Quando na tela "Primeiro Acesso" acionou o botão "Pessoa Jurídica"
        Então o sistema redirecionou para o formulário de cadastro
        E os campos estão alinhados corretamente conforme os elementos abaixo
            | Região Avatar   | Botão "Imagem" (Clique para selecionar um avatar) e texto informativo "Dimensões recomendadas 100px x 100px até 250KB" |
            | Região Dados    | Campos "CNPJ", "Razão Social", "Nome Fantasia" e "Inscrição Estadual"                                                  |
            | Região Contato  | Campos "E-mail" e "Celular"                                                                                            |
            | Região Endereço | Campos "CEP", "Endereço", "Número", "Complemento", "Bairro", "Estado" e "Cidade"                                       |
            | Região Senha    | Campos "Senha" e "Confirmar Senha"                                                                                     |
            | Rodapé          | Checkbox "Concordo e aceito o termo de consentimento da LGPD.*" e "Concordo e aceito o regulamento da campanha.*"      |
            | Rodapé          | Botões "Voltar" e "Finalizar Cadastro"                                                                                 |


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Física - CPF cadastrado na base - Status diferente de "Pendente"
        Dado que o usuário acionou o botão "Primeiro Acesso"
        Quando na tela "Primeiro Acesso" acionou o botão "Pessoa Física"
        Então o sistema redirecionou para o formulário de cadastro
        Quando preencher com um "<CPF>" cadastrado na base de dados para essa campanha
        Mas com "<Status>" diferente de Pendente
        E preencheu corretamente os demais campos
        E acionar o botão "Finalizar Cadastro"  
        Então o sistema sinaliza o campo "CPF" com a mensagem "<Mensagem do Sistema>"
        E não finaliza do cadastro
            Exemplos:
            | <CPF>          | <Status>                 | <Mensagem do Sistema>                                                   |
            | 348.108.998-88 | Inativo                  | Falha de Autenticação                                                   |
            | 348.108.998-88 | Suspenso Temporariamente | Falha de autenticação. Entre em contato com o administrador da campanha |
            | 348.108.998-88 | Ativo                    | CPF já cadastrado. Clique em "Login" ou em "Esqueceu sua senha?"        |
    #verificar máscara de CPF no campo
    #dados fictícios, utilizar conforme base da campanha no momento do teste


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Jurídica - CNPJ cadastrado na base - Status diferente de "Pendente"
        Dado que o usuário acionou o botão "Primeiro Acesso"
        Quando na tela "Primeiro Acesso" acionou o botão "Pessoa Jurídica"
        Então o sistema redirecionou para o formulário de cadastro
        Quando preencher com um "<CNPJ>" cadastrado na base de dados para essa campanha
        Mas com "<Status>" diferente de Pendente
        E preencheu corretamente os demais campos
        E acionar o botão "Finalizar Cadastro"  
        Então o sistema sinaliza o campo "CNPJ" com a mensagem "<Mensagem do Sistema>"
        E não finaliza do cadastro
            Exemplos:
            | <CNPJ>         | <Status>                 | <Mensagem do Sistema>                                                   |
            | 348.108.998-88 | Inativo                  | Falha de Autenticação                                                   |
            | 348.108.998-88 | Suspenso Temporariamente | Falha de autenticação. Entre em contato com o administrador da campanha |
            | 348.108.998-88 | Ativo                    | CNPJ já cadastrado. Clique em "Login" ou em "Esqueceu sua senha?"       |

@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Física - CPF cadastrado na base - CPF Inválido
        Dado que o usuário acionou o botão "Primeiro Acesso"
        Quando na tela "Primeiro Acesso" acionou o botão "Pessoa Física"
        Então o sistema redirecionou para o formulário de cadastro
        Quando preencher com um "<CPF>" inválido
        E preencheu corretamente os demais campos
        E acionar o botão "Finalizar Cadastro"  
        Então o sistema sinaliza o campo "CPF" com a mensagem "<Mensagem do Sistema>"
        E não finaliza do cadastro
            Exemplos:
            | <CPF>                         | <Mensagem do Sistema>                                                   |
            | CPF inválido e não cadastrado | Falha de Autenticação                                                   |
            | CPF inválido e cadastrado     | Falha de autenticação. Entre em contato com o administrador da campanha |


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Jurídica - CNPJ cadastrado na base - CNPJ Inválido
        Dado que o usuário acionou o botão "Primeiro Acesso"
        Quando na tela "Primeiro Acesso" acionou o botão "Pessoa Jurídica"
        Então o sistema redirecionou para o formulário de cadastro
        Quando preencher com um "<CNPJ>" inválido
        E preencheu corretamente os demais campos
        E acionar o botão "Finalizar Cadastro"  
        Então o sistema sinaliza o campo "CNPJ" com a mensagem "<Mensagem do Sistema>"
        E não finaliza do cadastro
            Exemplos:
            | <CNPJ>                         | <Mensagem do Sistema>                                                   |
            | CNPJ inválido e não cadastrado | Falha de Autenticação                                                   |
            | CNPJ inválido e cadastrado     | Falha de autenticação. Entre em contato com o administrador da campanha |            
            
    #verificar máscara de CPF e CNPJ nos campos        



@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Física - CPF cadastrado na base - Não preencher os campos obrigatórios
        Dado que o usuário está no formulário de "Primeiro Acesso" de "Pessoa Física"
        Quando não preencher nenhum campo obrigatório 
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza com a mensagem "<Resposta do sistema>" em cada campo obrigatório
            Exemplos:
            | <CPF>    | <NOME>   | <DATA NASCIMENTO> | <E-MAIL> | <CELULAR> | <CEP>  | <ENDEREÇO> | <NÚMERO> | <COMPLEMENTO> | <BAIRRO> | <ESTADO> | <CIDADE> | <SENHA> | <CONFIRMAR SENHA> | <ACEITE LGPD> | <ACEITE REGULAMENTO> | <RESPOSTA DO Sistema> |
            | ** Vazio | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | ** Vazio | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | ** Vazio          | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | ** Vazio | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   |** Vazio   | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    |** Vazio| Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | ** Vazio   | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | ** Vazio | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   |** Vazio       | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | ** Vazio | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | ** Vazio | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | ** Vazio | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | ** Vazio  Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | ** Vazio          | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | ** Vazio      | Selecionado          | Marque esta caixa     |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | ** Vazio             | Marque esta caixa     |                                                                        



@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Jurídica - CNPJ cadastrado na base - Não preencher os campos obrigatórios
        Dado que o usuário está no formulário de "Primeiro Acesso" de "Pessoa Jurídica"
        Quando não preencher nenhum campo obrigatório 
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza com a mensagem "<Resposta do sistema>" em cada campo obrigatório
            Exemplos:
            | <CNPJ>   | <RAZÃO SOCIAL>| <NOME FANTASIA> | <INSCRIÇÃO ESTADUAL> | <E-MAIL>| <CELULAR> | <CEP>      | <ENDEREÇO> | <NÚMERO>      | <COMPLEMENTO> | <BAIRRO> | <ESTADO> | <CIDADE> | <SENHA> | <CONFIRMAR SENHA> | <ACEITE LGPD> | <ACEITE REGULAMENTO>|<RESPOSTA DO SISTEMA>|
            | ** Vazio | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | ** Vazio      | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | ** Vazio        | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | ** Vazio             | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               |** Vazio | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  |** Vazio   | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | ** Vazio   | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | ** Vazio   | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     |** Vazio       | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | ** Vazio      | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | ** Vazio | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | ** Vazio | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | ** Vazio| Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | ** Vazio | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | ** Vazio          | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | ** Vazio      | Selecionado         | Marque esta caixa     |                                                                        
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Válido        | ** Vazio            | Marque esta caixa     |            
            



@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Física - CPF cadastrado na base - Campos inválidos do formulário
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando preencher valores inválidos nos campos do formulário
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza conforme cada mensagem "<Resposta do sistema>"
            Exemplos:
            | <Campos>             | <Valor Inválido>             | <Resposta do sistema>                                            |
            | <Nome>               | 'Teste'                      | Informe o seu nome completo                                      |
            | <Data de nascimento> | '31/02/2000'                 | Data inválida                                                    |
            | <Data de nascimento> | '31/15/2000'                 | Data inválida                                                    |
            | <Data de nascimento> | 'letra e caractere especial' | Bloquear digitação                                               |
            | <Data de nascimento> | '31/01/2020'                 | Para participar desta campanha, você precisa ter mais de 18 anos |
            | <Data de nascimento> | '31/01/2023'                 | Para participar desta campanha, você precisa ter mais de 18 anos |
            | <E-mail>             | 'xpto'                       | E-mail inválido                                                  |
            | <Celular>            | '(19) 888'                   | Celular inválido                                                 |
            | <Celular>            | '(99) 99999-9999'            | Celular inválido                                                 |
            | <Celular>            | '(19) 88899-99'              | Celular inválido                                                 |
            | <CEP>                | '13471-2'                    | 'CEP inválido'                                                   |
            | <CEP>                | '11.111-111'                 | 'CEP não encontrado'                                             |
            | <Senha>              | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                        |
            | <Confirme a senha>   | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                        |
            | <Senha>              | '12345678'                   | 'Este campo deve ser igual à senha'                              |
            | <Confirme a senha>   | '1234567890'                 | 'Este campo deve ser igual à senha'                              |


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Jurídica - CNPJ cadastrado na base - Campos inválidos do formulário
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando preencher valores inválidos nos campos do formulário
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza conforme cada mensagem "<Resposta do sistema>"
            Exemplos:
            | <Campos>             | <Valor Inválido>             | <Resposta do sistema>                                            |
            | <Razão Social>       | 'Teste'                      | Informe o seu nome completo                                      |
            | <Nome Fantasia>      | 'Teste'                      | Informe o seu nome completo                                      |
            | <Data de nascimento> | '31/02/2000'                 | Data inválida                                                    |
            | <Data de nascimento> | '31/15/2000'                 | Data inválida                                                    |
            | <Data de nascimento> | 'letra e caractere especial' | Bloquear digitação                                               |
            | <Data de nascimento> | '31/01/2020'                 | Para participar desta campanha, você precisa ter mais de 18 anos |
            | <Data de nascimento> | '31/01/2023'                 | Para participar desta campanha, você precisa ter mais de 18 anos |
            | <E-mail>             | 'xpto'                       | E-mail inválido                                                  |
            | <Celular>            | '(19) 888'                   | Celular inválido                                                 |
            | <Celular>            | '(99) 99999-9999'            | Celular inválido                                                 |
            | <Celular>            | '(19) 88899-99'              | Celular inválido                                                 |
            | <CEP>                | '13471-2'                    | 'CEP inválido'                                                   |
            | <CEP>                | '11.111-111'                 | 'CEP não encontrado'                                             |
            | <Senha>              | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                        |
            | <Confirme a senha>   | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                        |
            | <Senha>              | '12345678'                   | 'Este campo deve ser igual à senha'                              |
            | <Confirme a senha>   | '1234567890'                 | 'Este campo deve ser igual à senha'                              |


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ cadastrado na base - Dados Duplicados
        Dado que já existe na base desta campanha as informações abaixo para outro usuário de qualquer status
            | Email              | Celular         | 
            | teste@teste.com.br | (19) 99111-9911 |
        Quando um usuário acessar o formulário de "Primeiro Acesso"
        E preencher nos campos "Email" e "Celular" essas mesmas informações
        E acionar o botão "Finalizar Cadastro"
        Então o sistema  vai exibir a mensagem "E-mail já cadastrado" e "Celular já cadastrado"
        E não vai finalizar esse cadastro, impedindo as duplicadade de email e celular na base da campanha
        #deixar esses valores em dois usuários já existentes na base > ir alterando o status para que o sistema impeça o novo cadastro em tds os status
        #o sistema nao liberou o cadastro com duplicidade de dados com todos os status da campanha


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ cadastrado na base - Validação de CEP com preenchimento dos campos de endereço
        Dado que o usuário está no formulário de "Primeiro Acesso" 
        Quando preencher um "CEP" válido
        E der um 'tab' ou mudar de campo
        Então o sistema preenche automaticamente os campos "Endereço", "Bairro", "Cidade" e "Estado" confome "CORREIOS"
        Mas o número precisa ser preenchido pelo usuário


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ cadastrado na base - Finalizar Cadastro
        Dado que o usuário está no formulário de "Primeiro Acesso"
        E preencheu corretamente todos os campos
        Quando clicar no botão "Finalizar Cadastro"
        Então o sistema exibe um modal de sucesso com a mensagem "Sua conta foi cadastrada com sucesso! Você já pode realizar login na plataforma."
        E redireciona o usuário para a home deslogada (login)
                

@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ cadastrado na base - Links "Termo de consentimento LGPD" e "Regulamento da campanha"
        Dado que o usuário está no formulário de "Primeiro Acesso" 
        Quando clicar no link "Termo de consentimento LGPD"
        Então o "Termo de Consentimento para Tratamento de Dados" é aberta em uma nova aba do navegador
        Quando o usuário voltar ao formulário de "Primeiro Acesso"
        E clicar no link "Regulamento da campanha"
        Então as "Políticas Gerais" é aberta em uma nova aba do navegador


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ cadastrado na base - Validar vinculos e dados de account que foi ativada
        Dado que o usuário finalizou sua ativação com sucesso
        Quando o QA puxar o document na tabela 'account'
        Então todos os dados deverão estar registrados na tabela 'account' conforme o cadastro realizado pelo usuário
        
# CPF NÃO CADASTRADO NA BASE

@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Física - CPF Não cadastrado na base - Não preencher os campos obrigatórios
        Dado que o usuário está no formulário de "Primeiro Acesso" de "Pessoa Física"
        Quando não preencher nenhum campo obrigatório 
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza com a mensagem "<Resposta do sistema>" em cada campo obrigatório
            Exemplos:
            | <CPF>    | <NOME>   | <DATA NASCIMENTO> | <E-MAIL> | <CELULAR> | <CEP>  | <ENDEREÇO> | <NÚMERO> | <COMPLEMENTO> | <BAIRRO> | <ESTADO> | <CIDADE> | <SENHA> | <CONFIRMAR SENHA> | <ACEITE LGPD> | <ACEITE REGULAMENTO> | <RESPOSTA DO Sistema> |
            | ** Vazio | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | ** Vazio | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | ** Vazio          | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | ** Vazio | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   |** Vazio   | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    |** Vazio| Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | ** Vazio   | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | ** Vazio | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   |** Vazio       | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | ** Vazio | Válido   | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | ** Vazio | Válido   | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | ** Vazio | Válido  | Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | ** Vazio  Válido            | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | ** Vazio          | Selecionado   | Selecionado          | Preencha este campo   |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | ** Vazio      | Selecionado          | Marque esta caixa     |
            | Válido   | Válido   | Válida            | Válido   | Válido    | Válido | Válido     | Válido   | Válido        | Válido   | Válido   | Válido   | Válido  | Válido            | Selecionado   | ** Vazio             | Marque esta caixa     |                                                                        



@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Jurídica - CNPJ Não cadastrado na base - Não preencher os campos obrigatórios
        Dado que o usuário está no formulário de "Primeiro Acesso" de "Pessoa Jurídica"
        Quando não preencher nenhum campo obrigatório 
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza com a mensagem "<Resposta do sistema>" em cada campo obrigatório
            Exemplos:
            | <CNPJ>   | <RAZÃO SOCIAL>| <NOME FANTASIA> | <INSCRIÇÃO ESTADUAL> | <E-MAIL>| <CELULAR> | <CEP>      | <ENDEREÇO> | <NÚMERO>      | <COMPLEMENTO> | <BAIRRO> | <ESTADO> | <CIDADE> | <SENHA> | <CONFIRMAR SENHA> | <ACEITE LGPD> | <ACEITE REGULAMENTO>|<RESPOSTA DO SISTEMA>|
            | ** Vazio | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | ** Vazio      | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | ** Vazio        | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | ** Vazio             | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               |** Vazio | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  |** Vazio   | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | ** Vazio   | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | ** Vazio   | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     |** Vazio       | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | ** Vazio      | Válido   | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | ** Vazio | Válido   | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | ** Vazio | Válido  | Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | ** Vazio| Válido   | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | ** Vazio | Válido            | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | ** Vazio          | Selecionado   | Selecionado         | Preencha este campo   |
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | ** Vazio      | Selecionado         | Marque esta caixa     |                                                                        
            | Válido   | Válido        | Válida          | Válido               | Válido  | Válido    | Válido     | Válido     | Válido        | Válido        | Válido   | Válido   | Válido  | Válido   | Válido            | Válido        | ** Vazio            | Marque esta caixa     |            
            

@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Física - CPF Não cadastrado na base - Campos inválidos do formulário
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando preencher valores inválidos nos campos do formulário
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza conforme cada mensagem "<Resposta do sistema>"
            Exemplos:
            | <Campos>             | <Valor Inválido>             | <Resposta do sistema>                                            |
            | <Nome>               | 'Teste'                      | Informe o seu nome completo                                      |
            | <Data de nascimento> | '31/02/2000'                 | Data inválida                                                    |
            | <Data de nascimento> | '31/15/2000'                 | Data inválida                                                    |
            | <Data de nascimento> | 'letra e caractere especial' | Bloquear digitação                                               |
            | <Data de nascimento> | '31/01/2020'                 | Para participar desta campanha, você precisa ter mais de 18 anos |
            | <Data de nascimento> | '31/01/2023'                 | Para participar desta campanha, você precisa ter mais de 18 anos |
            | <E-mail>             | 'xpto'                       | E-mail inválido                                                  |
            | <Celular>            | '(19) 888'                   | Celular inválido                                                 |
            | <Celular>            | '(99) 99999-9999'            | Celular inválido                                                 |
            | <Celular>            | '(19) 88899-99'              | Celular inválido                                                 |
            | <CEP>                | '13471-2'                    | 'CEP inválido'                                                   |
            | <CEP>                | '11.111-111'                 | 'CEP não encontrado'                                             |
            | <Senha>              | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                        |
            | <Confirme a senha>   | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                        |
            | <Senha>              | '12345678'                   | 'Este campo deve ser igual à senha'                              |
            | <Confirme a senha>   | '1234567890'                 | 'Este campo deve ser igual à senha'                              |


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Primeiro Acesso - Pessoa Jurídica - CNPJ Não cadastrado na base - Campos inválidos do formulário
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando preencher valores inválidos nos campos do formulário
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza conforme cada mensagem "<Resposta do sistema>"
            Exemplos:
            | <Campos>             | <Valor Inválido>             | <Resposta do sistema>                                            |
            | <Razão Social>       | 'Teste'                      | Informe o seu nome completo                                      |
            | <Nome Fantasia>      | 'Teste'                      | Informe o seu nome completo                                      |
            | <Data de nascimento> | '31/02/2000'                 | Data inválida                                                    |
            | <Data de nascimento> | '31/15/2000'                 | Data inválida                                                    |
            | <Data de nascimento> | 'letra e caractere especial' | Bloquear digitação                                               |
            | <Data de nascimento> | '31/01/2020'                 | Para participar desta campanha, você precisa ter mais de 18 anos |
            | <Data de nascimento> | '31/01/2023'                 | Para participar desta campanha, você precisa ter mais de 18 anos |
            | <E-mail>             | 'xpto'                       | E-mail inválido                                                  |
            | <Celular>            | '(19) 888'                   | Celular inválido                                                 |
            | <Celular>            | '(99) 99999-9999'            | Celular inválido                                                 |
            | <Celular>            | '(19) 88899-99'              | Celular inválido                                                 |
            | <CEP>                | '13471-2'                    | 'CEP inválido'                                                   |
            | <CEP>                | '11.111-111'                 | 'CEP não encontrado'                                             |
            | <Senha>              | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                        |
            | <Confirme a senha>   | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                        |
            | <Senha>              | '12345678'                   | 'Este campo deve ser igual à senha'                              |
            | <Confirme a senha>   | '1234567890'                 | 'Este campo deve ser igual à senha'                              |


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ Não cadastrado na base - Dados Duplicados
        Dado que já existe na base desta campanha as informações abaixo para outro usuário de qualquer status
            | Email              | Celular         | 
            | teste@teste.com.br | (19) 99111-9911 |
        Quando um usuário acessar o formulário de "Primeiro Acesso"
        E preencher nos campos "Email" e "Celular" essas mesmas informações
        E acionar o botão "Finalizar Cadastro"
        Então o sistema  vai exibir a mensagem "E-mail já cadastrado" e "Celular já cadastrado"
        E não vai finalizar esse cadastro, impedindo as duplicadade de email e celular na base da campanha
        #deixar esses valores em dois usuários já existentes na base > ir alterando o status para que o sistema impeça o novo cadastro em tds os status
        #o sistema nao liberou o cadastro com duplicidade de dados com todos os status da campanha


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ Não cadastrado na base - Validação de CEP com preenchimento dos campos de endereço
        Dado que o usuário está no formulário de "Primeiro Acesso" 
        Quando preencher um "CEP" válido
        E der um 'tab' ou mudar de campo
        Então o sistema preenche automaticamente os campos "Endereço", "Bairro", "Cidade" e "Estado" confome "CORREIOS"
        Mas o número precisa ser preenchido pelo usuário


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ Não cadastrado na base - Finalizar Cadastro
        Dado que o usuário está no formulário de "Primeiro Acesso"
        E preencheu corretamente todos os campos
        Quando clicar no botão "Finalizar Cadastro"
        Então o sistema exibe um modal de sucesso com a mensagem "Sua conta foi cadastrada com sucesso! Você já pode realizar login na plataforma."
        E redireciona o usuário para a home deslogada (login)
                

@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ Não cadastrado na base - Links "Termo de consentimento LGPD" e "Regulamento da campanha"
        Dado que o usuário está no formulário de "Primeiro Acesso" 
        Quando clicar no link "Termo de consentimento LGPD"
        Então o "Termo de Consentimento para Tratamento de Dados" é aberta em uma nova aba do navegador
        Quando o usuário voltar ao formulário de "Primeiro Acesso"
        E clicar no link "Regulamento da campanha"
        Então as "Políticas Gerais" é aberta em uma nova aba do navegador


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Primeiro Acesso - CPF/CNPJ Não cadastrado na base - Validar vinculos e dados de account que foi ativada
        Dado que o usuário finalizou sua ativação com sucesso
        Quando o QA puxar o document na tabela 'account'
        Então todos os dados deverão estar registrados na tabela 'account' conforme o cadastro realizado pelo usuário