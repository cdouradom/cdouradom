#language: pt

Funcionalidade: Banking - Primeiro Acesso
 Como usuário pré cadastrado na campanha
 Quero fazer a ativação da minha conta
 Para acessar a plataforma

-----

Critérios de Aceitação:
 Não é obrigatório que o CPF seja pré cadastrado na plataforma para realizar a ativação da conta
 O cadastro na campanha passa a ser aberto tbm, mantendo cadastros com a base pré cadastrada já existente
 Ao acessar a opção "Quero me Cadastrar" o usuário deve informar o CPF e o CNPJ para o sistema validar
 O status da Revenda (CNPJ) deve ser Ativo na campanha
 O formulário de cadastro é composto dos campos: "CPF", "Nome Completo", "Data de nascimento", "Cargo", "E-mail", "Celular", "CEP", "Endereço", "Número", "Complemento", "Bairro", "Estado", "Cidade", "Senha", "Confirme a senha", "Flag: Li e concordo com os Termos da LGPD" e os botões "Finalizar Cadastro" e "Cancelar"
 No cargo exibir uma lista suspensa com as opções: "Vendedor"; "Gerente Direto"; "Supervisor", "Gerente Regional "
 No formulário de cadastro o "CPF" fica bloqueado para edição e exibe o documento informado na validação do CPF e CNPJ da Revenda
 O aceite de Regulamento é obrigatório após 1º login, sendo que o usuário cai logado após finalizar o cadastro e fechar o modal de sucesso
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
 CPF cadastrado na base: O CPF precisa ser válido
 CPF cadastrado na base: O status do usuário (CPF) deve ser Cadastro Pendente
 CPF cadastrado na base: Deve informar o CNPJ conforme vínculo já existente na tabela 'account_resale'
 CPF cadastrado na base: Deve informar o Cargo conforme vínculo já existente na tabel 'account_hierarchical_level'
 CPF cadastrado na base com status 'Ativo': Apresentar a mensagem "CPF já cadastrado. Clique em Fazer login"
 CPF cadastrado na base com status 'Inativo': Apresentar a mensagem "Falha de autenticação"
 CPF cadastrado na base com status 'Suspenso temporariamente': Apresentar a mensagem "Falha de autenticação. Entre em contato com o administrador da campanha" 
 CPF não cadastrado na base: O CPF precisa ser válido
 CPF não cadastrado na base: Precisa preencher um CNPJ válido
 CPF não cadastrado na base: O CNPJ da Revenda (válido) deve estar cadastrado na campanha e com status Ativo
 CPF não cadastrado na base: Ao finalizar seu cadastro o sistema faz o vínculo com o CNPJ informado
 CPF não cadastrado na base: Ao finalizar seu cadastro o sistema faz o vínculo com o cargo informado
 O aceite de termos NÃO é dado no formulário do primeiro acesso junto com o aceite de cookies, sendo obrigatório após o cadastro finalizado já na área logada
 Após o cadastro ser finalizado com sucesso, um modal de sucesso é exibido
 Após realizado o cadastro com sucesso, quando fechar o modal de sucesso o usuário cai logado no Banking
 
---

@manual
@Tarefa_#65978
@manual-result:success 
@manual-last-tested:06-12-2022
@manual-test-evidence:[Evidência](assets/B_Quero_me_cadastrar_Layout.mp4)
    Cenário: Quero me cadastrar, Layout e Cancelar
        Dado que o usuário acessou a url da campanha na visão do Banking
        Quando o usuário acionaro o botão "Quero me cadastrar" em todas as 3 etapas/banners
        Então o sistema redireciona o usuário para a tela de validação do "CPF" e "CNPJ" com os elementos na Tela
        Quando o usuário acionar o botão "Cancelar"
        Então o sistema redireciona o usuário de volta para a etapa dos banners
            | Texto "Bem-vindo(a) ao CLUBE AIWA..."  |                                                                                                        |
            | Campo "CPF"                            | Texto > Para iniciar o seu cadastro, precisamos validar seu CPF                                        |
            | Campo "CNPJ"                           | Texto > Para iniciar o seu cadastro, precisamos validar seu CNPJ                                       |
            | Botão "Validar"                        | clique > valida o preenchimento do CPF                                                                 |
            | Botão "Cancelar"                       | clique > redireciona o usuário de volta para a etapa dos banners, sendo a "1º etapa da área deslogada" |
    #Texto completo Bem-vindo(a) ao CLUBE AIWA: 
        #Bem-vindo(a) ao CLUBE AIWA. 
        #Aqui você tem uma ferramenta para atingir a excelência e performance nas vendas, contando com um programa completo de recompensas. 
        #Escolha inteligente é contar com a gente! 

@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:06-12-2022
@manual-test-evidence:[Evidência][Evidência_1](assets/B_PA_CPF_nao_informado.png),[Evidência_2](assets/B_PA_CNPJ_nao_informado.png)
    Cenário: CPF e CNPJ não preenchidos
        Dado que o usuário acionou o botão "Quero me cadastrar"
        Quando acionar o botão "Validar" 
        Mas não preencher os campos "Digite seu CPF" e "Digite o CNPJ da Revenda"
        Então o sistema sinaliza com a mensagem "Preencha este campo" em cada campo obrigatório, pois ambos são obrigatórios


# CPF CADASTRADO NA BASE

@manual
@Tarefa_#65978
@Ajuste_#66384
@manual-result:success
@manual-last-tested:06-12-2022
@manual-test-evidence:[Evidência_1](assets/B_PA_CPF_Inativo.png),[Evidência_2](assets/B_PA_CPF_Suspenso_temp.png),[Evidência_3](assets/B_PA_CPF_Ativo.png)
    Esquema do Cenário: CPF cadastrado na base -  Status diferente de Cadastro Pendente
        Dado que o usuário acionou o botão "Quero me cadastrar"
        Quando preencher com um "<CPF>" cadastrado na base de dados para essa campanha
        Mas com "<Status>" diferente de Ativo
        E preencheu corretamente o "CNPJ" da Revenda que possui vínculo na base
        E acionar o botão "Validar"  
        Então o sistema sinaliza com a mensagem em um modal "<Mensagem do Sistema>"
        E não avança para o formulário de "Primeiro Acesso", mantendo o usuário na mesma tela após fechar o modal
            Exemplos:
            | <CPF>          | <Status>                 | <Mensagem do Sistema>                                                   |
            | 348.108.998-88 | Inativo                  | Falha de Autenticação                                                   |
            | 348.108.998-88 | Suspenso Temporariamente | Falha de autenticação. Entre em contato com o administrador da campanha |
            | 348.108.998-88 | Ativo                    | CPF já cadastrado. Clique em "Login" ou em "Esqueceu sua senha?"        |
    #verificar máscara de CPF no campo
    #dados fictícios, utilizar conforme base da campanha no momento do teste



@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:06-12-2022
@manual-test-evidence:[Evidência_1](assets/B_PA_CNPJ_Nao_cadastrado.png),[Evidência_2](assets/B_PA_CNPJ_Invalido_cadastrado.png),[Evidência_3](assets/B_PA_CNPJ_Nao_cadastrado.png),[Evidência_4](assets/B_PA_CNPJ_Inativo.png)
    Esquema do Cenário: CPF cadastrado na base - CNPJ Revenda com valores inválidos
        Dado que o usuário acionou o botão "Quero me cadastrar"
        Quando preencher com um "CPF" cadastrado na base de dados para essa campanha
        E que esteja no status "Cadastro Pendente"
        Mas preencher com valores inválidos no "<CNPJ da Revenda>"
        E acionar o botão "Validar"  
        Então o sistema sinaliza com a mensagem em um modal "<Mensagem do Sistema>"
        E não avança para o formulário de "Primeiro Acesso", mantendo o usuário na mesma tela após fechar o modal
            Exemplos:
            | <CNPJ da Revenda>                          | <Mensagem do Sistema>                                                                                |
            | 'CNPJ inválido e não cadastrado'           | Falha de autenticação. Verifique o CNPJ digitado.                                                    |
            | 'CNPJ inválido e cadastrado'               | Falha de autenticação. Verifique o CNPJ digitado.                                                    |
            | 'CNPJ válido e não cadastrado na campanha' | Falha de autenticação. Verifique o CNPJ digitado ou entre em contato com o administrador da campanha |
            | 'CNPJ inativo e cadastrado'                | Falha de autenticação. Verifique o CNPJ digitado ou entre em contato com o administrador da campanha |
    #verificar máscara de CPF e CNPJ nos campos        


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_CNPJ_divergente_da_base_com_CPF.png)
    Esquema do Cenário: CPF cadastrado na base - CNPJ Revenda vínculo divergente
        Dado que o usuário acionou o botão "Quero me cadastrar"
        E preencheu com um "CPF" cadastrado na base de dados para essa campanha
        E que está no status "Cadastro Pendente"
        Quando preencher o "CNPJ da Revenda" que não seja conforme o vínculo já existente na tabela 'account_resale'
        E acionar o botão "Validar"  
        Então o sistema sinaliza com a mensagem "Falha de autenticação. Verifique o CNPJ digitado ou entre em contato com o administrador da campanha"


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_Layout.mp4)
    Cenário: CPF cadastrado na base - Acessar Formulário, Layout e Cancelar
        Dado que o usuário acionou o botão "Quero me cadastrar"
        E preencheu com um "CPF" cadastrado com status 3 "Cadastro Pendente" na campanha
        E preencheru o "CNPJ da Revenda" conforme o vínculo já existente entre tal 'account' e 'resale'
        Quando acionar o botão "Validar" 
        Então o sistema redireciona o usuário para o formulário de "Primeiro Acesso"
        E o "CPF" virá preenchido com o documento informado na etapa anterior
        E o campo CPF será bloqueado para edição no formulário de "Primeiro Acesso"
        Quando o usuário visualizar todos os campos abaixo na tela
            | <Campos>           |
            | CPF                |
            | Nome Completo      |
            | Data de nascimento |
            | Cargo              |
            | E-mail             |
            | Celular            |
            | CEP                |
            | Endereço           |
            | Número             |
            | Complemento        |
            | Bairro             |
            | Estado             |
            | Cidade             |
            | Senha              |
            | Confirme a senha   |
        Então os elementos da tela estão alinhados corretamente
        Quando o usuário acionar o botão "Cancelar" dentro deste formulário
        Então o sistema redireciona o usuário de volta para a etapa "Quero me cadastrar"


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência_1](assets/B_PA_Nome_nao_informado.png),[Evidência_2](assets/B_PA_NC_nao_informado.png),[Evidência_3](assets/B_PA_Cargo_nao_informado.png),[Evidência_4](assets/B_PA_Email_nao_informado.png),[Evidência_5](assets/B_PA_Celular_nao_informado.png),[Evidência_6](assets/B_PA_CEP_nao_informado.png),[Evidência_7](assets/B_PA_Endereço_nao_informado.png),[Evidência_8](assets/B_PA_Numero_nao_informado.png),[Evidência_9](assets/B_PA_Bairro_nao_informado.png),[Evidência_10](assets/B_PA_UF_nao_informado.png),[Evidência_11](assets/B_PA_Senha_nao_informada.png),[Evidência_12](assets/B_PA_Confirmar_senha_nao_informada.png),[Evidência_13](assets/B_PA_Flag_nao_informado.png)
    Esquema do Cenário: CPF cadastrado na base - Não preencher os campos obrigatórios
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando acionar o botão "Finalizar Cadastro"
        Mas não preencher nenhum campo do formulário além do CPF que já vem preenchido com o documento informado na etapa anterior, OU deixar um campo obrigatório vazio
        Então o sistema sinaliza com a mensagem "<Resposta do sistema>" em cada campo obrigatório
            Exemplos:
            | <Nome Completo > | <Data de nascimento> | <Cargo> | <E-mail> | <Celular> | <CEP>   | <Endereço> | <Número> | <Bairro> | <Estado> | <Cidade> | <Senha> | <Confirme a senha> | <Flag Termos da LGPD> | <Resposta do sistema>                                           |
            | 'vazio'          | 'vazio'              | 'vazio' | 'vazio'  | 'vazio'   | 'vazio' | 'vazio'    | 'vazio'  | 'vazio'  | 'vazio'  | 'vazio'  | 'vazio' | 'vazio'            | 'vazio'               | "Alertar em todos ou no primeiro cammpo e ir alertando um a um" |
            | 'VAZIO'          | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "nforme o seu nome completo"                                    |
            | 'OK'             | 'VAZIO'              | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe a data de nascimento"                                  |
            | 'OK'             | 'OK'                 | 'VAZIO' | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Selecione o cargo"                                             |
            | 'OK'             | 'OK'                 | 'OK'    | 'VAZIO'  | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu e-mail"                                          |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'VAZIO'   | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu celular "                                        |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'VAZIO' | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu CEP"                                             |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'VAZIO'    | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu endereço"                                        |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'VAZIO'  | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o número"                                              |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'VAZIO'  | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu bairro"                                          |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'VAZIO'  | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Selecione o estado"                                            |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'VAZIO'  | 'OK'    | 'OK'               | 'OK'                  | "Selecione a cidade"                                            |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'VAZIO' | 'OK'               | 'OK'                  | "Insira uma senha"                                              |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'VAZIO'            | 'OK'                  | "Confirme a senha"                                              |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'VAZIO'               | "Marque essa opção se quiser continuar."                        |


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência_1](assets/B_PA_Nome_incompleto.png),[Evidência_2](assets/B_PA_NC_invalida.png),[Evidência_3](assets/B_PA_NC_invalida.png),[Evidência_4](assets/B_PA_NC_menor_18_anos.png),[Evidência_5](assets/B_PA_Cargo_divergente.png),[Evidência_6](assets/B_PA_Celular_invalido.png),[Evidência_7](assets/B_PA_Celular_invalido_2.png),[Evidência_8](assets/B_PA_CEP_incompleto.png),[Evidência_9](assets/B_PA_CEP_invalido.png),[Evidência_10](assets/B_PA_Senha_menor_8.png),[Evidência_11](assets/B_PA_Senha_divergente.png)
    Esquema do Cenário: CPF cadastrado na base - Campos inválidos do formulário
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando preencher valores inválidos nos campos do formulário
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza conforme cada mensagem "<Resposta do sistema>"
            Exemplos:
            | <Campos>             | <Valor Inválido>             | <Resposta do sistema>                                                                      |
            | <Nome Completo>      | 'Teste'                      | Informe nome e sobrenome                                                                   |
            | <Data de nascimento> | '31/02/2000'                 | Data inválida                                                                              |
            | <Data de nascimento> | '31/15/2000'                 | Data inválida                                                                              |
            | <Data de nascimento> | 'letra e caractere especial' | Bloquear digitação                                                                         |
            | <Data de nascimento> | '31/01/2020'                 | Para participar desta campanha, você precisa ter mais de 18 anos                           |
            | <Data de nascimento> | '31/01/2023'                 | Para participar desta campanha, você precisa ter mais de 18 anos                           |
            | <Cargo>              | 'divergente'                 | O cargo selecionado não corresponde ao informado pelo administrador da campanha. Verifique |
            | <E-mail>             | 'xpto'                       | E-mail inválido                                                                            |
            | <Celular>            | '(19) 888'                   | Celular inválido                                                                           |
            | <Celular>            | '(99) 99999-9999'            | Celular inválido                                                                           |
            | <Celular>            | '(19) 88899-99'              | Celular inválido                                                                           |
            | <CEP>                | '13471-2'                    | 'CEP inválido'                                                                             |
            | <CEP>                | '11.111-111'                 | 'CEP não encontrado'                                                                       |
            | <Senha>              | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                                                  |
            | <Confirme a senha>   | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                                                  |
            | <Senha>              | '12345678'                   | 'A senha não é a mesma'                                                                    |
            | <Confirme a senha>   | '1234567890'                 | 'A senha não é a mesma'                                                                    |



@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_Celular_Email_duplicado.png)
    Cenário: CPF cadastrado na base - Dados duplicados
        Dado que já existe na base desta campanha as informações abaixo para outro usuário C(CPF) de qualquer status
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
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_Endereço_completo.mp4)
    Cenário: CPF cadastrado na base - Validação de CEP com preenchimento dos campos de endereço
        Dado que o usuário está no formulário de "Primeiro Acesso" 
        Quando preencher um "CEP" válido
        E der um 'tab' ou mudar de campo
        Então o sistema preenche automaticamente os campos "Endereço", "Bairro", "Cidade" e "Estado" confome "CORREIOS"
        Mas o número precisa ser preenchido pelo usuário


@manual
@Tarefa_#65978
@Ajuste_#66431
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_Cadastro_sucesso.mp4)
    Cenário: CPF cadastrado na base - Finalizar Cadastro
        Dado que o usuário está no formulário de "Primeiro Acesso"
        E preencheu corretamente todos os campos
        Quando clicar no botão "Finalizar Cadastro"
        Então o sistema exibe um modal de sucesso com a mensagem 
        |"Cadastro Concluído"|
        |Seu cadastro foi ativado com sucesso"|
        |Agora você já pode fazer login na nossa plataforma.|
        E redireciona o usuário para a área logada do Banking #ou para a tela de login direto
        Mas mantém o usuário na tela de "Aceite de Regulamento"
        E não permite navegação no banking sem dar o aceite
        

@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_Reg&Flag.mp4)
    Cenário: CPF cadastrado na base - Aceite de Regulamento
        Dado que o usuário fez seu cadastro de "Primeiro Acesso"
        E caiu na área logada do Banking ou quando fizer seu login pela primeira vez na plataforma Banking
        Então a primeira tela que lhe será apresentada é a do "Regulamento" com um PDF para leitura e/ou download
        E uma flag para aceite obrigatório
        E um botão "Aceitar"
        Quando o usuário acionar o botão "Aceitar" sem ter marcado a flag
        Então o sistema exibe um alerta na flag para ser marcada
        E o usuário não conseguirá trocar de tela através dos menus ou url enquanto não marcar a flag e Aceitar, mesmo que em novos logins, ficando "preso" no Regulamento até o devido aceite
        Quando o usuário marcar a flag
        E acionar o botão "Aceitar"
        Então o sistema registra o aceite do usuário na tabela account_agree_terms_log
        E altera o registro dessa account na tabela account_agree_terms como 1 para não solicitar novo aceite #só torna pedir aceite, se houver mudança na tabela account_agree_terms.agree (1 não pede aceite e 0 pede)
        E redireciona o usuário para a home da campanha liberando sua navegação em todas as demais páginas


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência_1](assets/B_PA_account.mp4),[Evidência_2](assets/B_PA_hierarchical_level.png),[Evidência_3](assets/B_PA_resale.png)
    Cenário: CPF cadastrado na base - Validar vinculos e dados de account que foi ativada
        Dado que o usuário finalizou sua ativação com sucesso
        Quando o QA puxar o document na tabela 'account'
        Então todos os dados deverão estar registrados conforme o cadastro realizado pelo usuário
        E o status do usuário deverá ser Ativo
        E o cargo deverá costar na 'account_hierarchical_level_id' da 'account' conforme cargo ja existente antes da ativação da conta #SELECT * FROM `account` WHERE account_parent_id = '731469' AND account_hierarchical_level_id = 'IDdoCargo'
        Quando o QA consultar o account_id do user na 'account_resale' - #SELECT * FROM `account_resale` WHERE account_id = '734343'
        Então o vínculo deverá ser listado em uma única linha conforme já existia antes da ativação da conta entre o account_id e a account_campaign_resale_id #id do usuário e id da revenda
        

# CPF NÃO CADASTRADO NA BASE

@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_CPF_invalido.png)
    Cenário: CPF NÃO cadastrado na base - CPF inválido
        Dado que o usuário acionou o botão "Quero me cadastrar"
        Quando preencher com um "CPF" NÃO cadastrado na base de dados dessa campanha
        Mas sendo um "CPF Inválido"
        E preencheu com um "CNPJ" da Revenda cadastrado e ativo na campanha
        E acionar o botão "Validar"  
        Então o sistema sinaliza com a mensagem em um modal "Falha de autenticação. Verifique o CPF digitado"
        E não avança para o formulário de "Primeiro Acesso", mantendo o usuário na mesma tela após fechar o modal


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência_1](assets/B_PA_CPF_CNPJ_invalido.png),[Evidência_2](assets/B_PA_CNPJ_invalido_2.png),[Evidência_3](assets/B_PA_CNPJ_invalido_cadastrado_2.png),[Evidência_4](assets/B_PA_CPF_CNPJ_invalido_cadastrado.png),[Evidência_5](assets/B_PA_CNPJ_nao_cadastrado2.png),[Evidência_6](assets/B_PA_CNPJ_Inativo2.png)
    Cenário: CPF NÃO cadastrado na base - CPF e/ou CNPJ com valores inválidos
        Dado que o usuário acionou o botão "Quero me cadastrar"
        Quando preencher os campos "<Digite seu CPF>" com valores inválidos
        E preencher o campo "<Digite o CNPJ da Revenda>" com valores inválidos
        E acionar o botão "Validar"  
        Então o sistema sinaliza com as respectivas mensagens em um modal conforme "<Resposta do sistema>" "Falha de autenticação. Verifique o CPF digitado" e "Falha de autenticação. Verifique o CNPJ digitado"
        E não avança para o formulário de "Primeiro Acesso", mantendo o usuário na mesma tela após fechar o modal
            Exemplos:
            | <Digite seu CPF> | <Digite o CNPJ da Revenda>                    | <Resposta do sistema>                                                                                  |
            | 'Inválido'       | 'CNPJ inválido e não cadastrado'              | "Falha de autenticação. Verifique o CPF digitado" ; "Falha de autenticação. Verifique o CNPJ digitado" |
            | 'Válido'         | 'CNPJ inválido e não cadastrado'              | Falha de autenticação. Verifique o CNPJ digitado.                                                      |
            | 'Inválido'       | 'CNPJ inválido e cadastrado'                  | Falha de autenticação. Verifique o CNPJ digitado.                                                      |
            | 'Válido'         | 'CNPJ inválido e cadastrado'                  | Falha de autenticação. Verifique o CNPJ digitado.                                                      |
            | 'Inválido'       | 'CNPJ válido, mas não cadastrado na campanha' | Falha de autenticação. Verifique o CNPJ digitado ou entre em contato com o administrador da campanha   |
            | 'Válido'         | 'CNPJ válido, mas não cadastrado na campanha' | Falha de autenticação. Verifique o CNPJ digitado ou entre em contato com o administrador da campanha   |
            | 'Inválido'       | 'CNPJ inativo e cadastrado'                   | Falha de autenticação. Verifique o CNPJ digitado ou entre em contato com o administrador da campanha   |
            | 'Válido'         | 'CNPJ inativo e cadastrado'                   | Falha de autenticação. Verifique o CNPJ digitado ou entre em contato com o administrador da campanha   |
 

@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_Layout_fora_base.mp4)
    Cenário: CPF NÃO cadastrado na base - Acessar Formulário, Layout e Cancelar
        Dado que o usuário acionou o botão "Quero me cadastrar"
        E preencheu com um "CPF" não cadastrado na campanha
        Mas sendo um documento válido
        E preencheu o "CNPJ da Revenda" conforme Revenda existente e Ativa na campanha
        Quando acionar o botão "Validar" 
        Então o sistema redireciona o usuário para o formulário de "Primeiro Acesso"
        E o "CPF" virá preenchido com o documento informado na etapa anterior
        Mas bloqueado para edição
        Quando o usuário visualizar todos os campos abaixo na tela
            | <Campos>           |
            | CPF                |
            | Nome Completo      |
            | Data de nascimento |
            | Cargo              |
            | E-mail             |
            | Celular            |
            | CEP                |
            | Endereço           |
            | Número             |
            | Complemento        |
            | Bairro             |
            | Estado             |
            | Cidade             |
            | Senha              |
            | Confirme a senha   |
        Então os elementos da tela estão alinhados corretamente
        Quando o usuário acionar o botão "Cancelar" dentro deste formulário
        Então o sistema redireciona o usuário de volta para a etapa "Quero me cadastrar"


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_CPF_nao_cadastrado_dados_nao_informado.mp4)
    Esquema do Cenário: CPF NÃO cadastrado na base - Não preencher os campos obrigatórios
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando acionar o botão "Finalizar Cadastro"
        Mas não preencher nenhum campo do formulário além do CPF que já vem preenchido com o documento informado na etapa anterior, OU deixar um campo obrigatório vazio
        Então o sistema sinaliza com a mensagem "<Resposta do sistema>" em cada campo obrigatório
            Exemplos:
            | <Nome Completo > | <Data de nascimento> | <Cargo> | <E-mail> | <Celular> | <CEP>   | <Endereço> | <Número> | <Bairro> | <Estado> | <Cidade> | <Senha> | <Confirme a senha> | <Flag Termos da LGPD> | <Resposta do sistema>                                           |
            | 'vazio'          | 'vazio'              | 'vazio' | 'vazio'  | 'vazio'   | 'vazio' | 'vazio'    | 'vazio'  | 'vazio'  | 'vazio'  | 'vazio'  | 'vazio' | 'vazio'            | 'vazio'               | "Alertar em todos ou no primeiro cammpo e ir alertando um a um" |
            | 'VAZIO'          | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "nforme o seu nome completo"                                    |
            | 'OK'             | 'VAZIO'              | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe a data de nascimento"                                  |
            | 'OK'             | 'OK'                 | 'VAZIO' | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Selecione o cargo"                                             |
            | 'OK'             | 'OK'                 | 'OK'    | 'VAZIO'  | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu e-mail"                                          |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'VAZIO'   | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu celular "                                        |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'VAZIO' | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu CEP"                                             |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'VAZIO'    | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu endereço"                                        |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'VAZIO'  | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o número"                                              |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'VAZIO'  | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Informe o seu bairro"                                          |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'VAZIO'  | 'OK'     | 'OK'    | 'OK'               | 'OK'                  | "Selecione o estado"                                            |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'VAZIO'  | 'OK'    | 'OK'               | 'OK'                  | "Selecione a cidade"                                            |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'VAZIO' | 'OK'               | 'OK'                  | "Insira uma senha"                                              |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'VAZIO'            | 'OK'                  | "Confirme a senha"                                              |
            | 'OK'             | 'OK'                 | 'OK'    | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'VAZIO'               | "Marque essa opção se quiser continuar."                        |


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_CPF_nao_cadastrados_dados_invalidos.mp4)
    Esquema do Cenário: CPF NÃO cadastrado na base - Campos inválidos do formulário
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando preencher valores inválidos nos campos do formulário
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza conforme cada mensagem "<Resposta do sistema>"
            Exemplos:
            | <Campos>             | <Valor Inválido>             | <Resposta do sistema>                                                                      |
            | <Nome Completo>      | 'Teste'                      | Informe nome e sobrenome                                                                   |
            | <Data de nascimento> | '31/02/2000'                 | Data inválida                                                                              |
            | <Data de nascimento> | '31/15/2000'                 | Data inválida                                                                              |
            | <Data de nascimento> | 'letra e caractere especial' | Bloquear digitação                                                                         |
            | <Data de nascimento> | '31/01/2020'                 | Para participar desta campanha, você precisa ter mais de 18 anos                           |
            | <Data de nascimento> | '31/01/2023'                 | Para participar desta campanha, você precisa ter mais de 18 anos                           |
            | <E-mail>             | 'xpto'                       | E-mail inválido                                                                            |
            | <Celular>            | '(19) 888'                   | Celular inválido                                                                           |
            | <Celular>            | '(99) 99999-9999'            | Celular inválido                                                                           |
            | <Celular>            | '(19) 88899-99'              | Celular inválido                                                                           |
            | <CEP>                | '13471-2'                    | 'CEP inválido'                                                                             |
            | <CEP>                | '11.111-111'                 | 'CEP não encontrado'                                                                       |
            | <Senha>              | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                                                  |
            | <Confirme a senha>   | '123'                        | 'A senha deve conter no mínimo 8 dígitos'                                                  |
            | <Senha>              | '12345678'                   | 'As senhas informadas são diferentes. Verifique'                                           |
            | <Confirme a senha>   | '1234567890'                 | 'As senhas informadas são diferentes. Verifique'                                           |



@manual
@Tarefa_#65978
@Ajuste_66446
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_CPF_nao_cadastrado_duplicidade.png)
    Cenário: CPF NÃO cadastrado na base - Dados duplicados
        Dado que já existe na base desta campanha as informações abaixo para outro usuário (CPF) de qualquer status
            | Email              | Celular         | 
            | teste@teste.com.br | (19) 99111-9911 |
        Quando um usuário acessar o formulário de "Primeiro Acesso"
        E preencher nos campos "Email" e "Celular" essas mesmas informações
        E acionar o botão "Finalizar Cadastro"
        Então o sistema  vai exibir a mensagem "E-mail já cadastrado" e "Celular já cadastrado"
        E não vai finalizar esse cadastro, impedindo as duplicadade de email e celular na base da campanha
        #deixar esses valores em dois usuários já existentes na base > ir alterando o status para que o sistema impeça o novo cadastro em tds os status


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_Endereço_completo.mp4)
    Cenário: CPF NÃO cadastrado na base - Validação de CEP com preenchimento dos campos de endereço
        Dado que o usuário está no formulário de "Primeiro Acesso" 
        Quando preencher um "CEP" válido
        E der um 'tab' ou mudar de campo
        Então o sistema preenche automaticamente os campos "Endereço", "Bairro", "Cidade" e "Estado" confome "CORREIOS"
        Mas o número precisa ser preenchido pelo usuário


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_CPF_nao_cadastrado_cadastro_sucesso.mp4)
    Cenário: CPF NÃO cadastrado na base - Finalizar Cadastro
        Dado que o usuário está no formulário de "Primeiro Acesso"
        E preencheu corretamente todos os campos
        Quando clicar no botão "Finalizar Cadastro"
        Então o sistema exibe um modal de sucesso com a mensagem 
        |"Cadastro Concluído"|
        |Seu cadastro foi ativado com sucesso"|
        |Agora você já pode fazer login na nossa plataforma.|
        E redireciona o usuário para a área logada do Banking #ou para a tela de login direto
        Mas mantém o usuário na tela de "Aceite de Regulamento"
        E não permite navegação no banking sem dar o aceite
        

@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_CPF_nao_cadastrado_Reg&Flag.mp4)
    Cenário: CPF NÃO cadastrado na base - Aceite de Regulamento
        Dado que o usuário fez seu cadastro de "Primeiro Acesso"
        E caiu na área logada do Banking ou quando fizer seu login pela primeira vez na plataforma Banking
        Então a primeira tela que lhe será apresentada é a do "Regulamento" com um PDF para leitura e/ou download
        E uma flag para aceite obrigatório
        E um botão "Aceitar"
        Quando o usuário acionar o botão "Aceitar" sem ter marcado a flag
        Então o sistema exibe um alerta na flag para ser marcada
        E o usuário não conseguirá trocar de tela através dos menus ou url enquanto não marcar a flag e Aceitar, mesmo que em novos logins, ficando "preso" no Regulamento até o devido aceite
        Quando o usuário marcar a flag
        E acionar o botão "Aceitar"
        Então o sistema registra o aceite do usuário na tabela account_agree_terms_log
        E altera o registro dessa account na tabela account_agree_terms como 1 para não solicitar novo aceite #só torna pedir aceite, se houver mudança na tabela account_agree_terms.agree (1 não pede aceite e 0 pede)
        E redireciona o usuário para a home da campanha liberando sua navegação em todas as demais páginas


@manual
@Tarefa_#65978
@manual-result:success
@manual-last-tested:07-12-2022
@manual-test-evidence:[Evidência](assets/B_PA_CPF_nao_cadastrado_account_hierar.mp4)
    Cenário: CPF NÃO cadastrado na base - Validar vinculos e dados de account que foi CADASTRADA
        Dado que o usuário finalizou seu cadastro com sucesso
        Quando o QA puxar o document na tabela 'account'
        Então todos os dados deverão estar registrados conforme o cadastro realizado pelo usuário
        E o status do usuário deverá ser Ativo
        E o cargo deverá costar na 'account_hierarchical_level_id' da 'account' conforme opção selecionada pelo usuário no cadastro #SELECT * FROM `account` WHERE account_parent_id = '731469' AND account_hierarchical_level_id = 'IDdoCargo'
        Quando o QA consultar o account_id do user na 'account_resale' - #SELECT * FROM `account_resale` WHERE account_id = '734343'
        Então o vínculo deverá ser listado em uma única linha conforme recém realizdado no cadastro da conta entre o account_id e a account_campaign_resale_id #id do usuário e id da revenda
        
#23 CN