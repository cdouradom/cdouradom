#language: pt

Funcionalidade: Banking - Primeiro Acesso
 Como usuário pré cadastrado na campanha
 Quero fazer a ativação da minha conta
 Para acessar a plataforma

-----

Critérios de Aceitação:
 O usuário precisar estar pré cadastrado na plataforma para realizar a ativação da conta
 O status do usuário deve ser Cadastro Pendente
 O usuário precisa ter vínculo com um Distribuidor, mas não é impedimento para o primeiro acesso, pois é utilizado na segmentação dos módulos (vínculo da base é uma configuração interna)
 O usuário precisa ter um cargo pré configurado, mas não é impedimento para o primeiro accesso, pois é utilizado na segmentação dos módulos
 O aceite de termos é dado ainda no formulário do primeiro acesso, junto com o aceite de cookies
 O CPF precisa ser válido
 O email precisa ser reconhecido como tal
 Não pode ter duplicidade de email
 Não pode ter duplicidade de Celular
 Não pode ter duplicidade de CPF
 É obrigatório nome com sobrenome
 Precisa ter 18 anos ou mais para ativar a conta e data de nascimento válida no calendário
 O endereço é preenchido pelo sistema conforme CEP digitado pelo usuário
 As senhas precisam ser iguais
 Gênero e Estado Civil não existem no primeiro acesso
 
---

@manual
@Tarefa_#:#59194
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Area_deslogada_Cadastro_Layout.webm)
    Cenário: Área deslogada - Quero me cadastrar, Layout e Cancelar
        Dado que o usuário acessou a url da campanha na visão do Banking
        Quando o usuário acionaro o botão "Quero me cadastrar" em todas as 3 etapas/banners
        Então o sistema redireciona o usuário para a tela de validação do "CPF" com os elementos na Tela
            | Texto "Bem-vindo(a) ao CLUBE AIWA..."  |                                                                                                        |
            | Campo "CPF"                            | Texto > Para iniciar o seu cadastro, precisamos validar seu CPF                                        |
            | Botão "Validar"                        | clique > valida o preenchimento do CPF                                                                 |
            | Botão "Cancelar"                       | clique > redireciona o usuário de volta para a etapa dos banners, sendo a "1º etapa da área deslogada" |
    #Texto completo Bem-vindo(a) ao CLUBE AIWA: 
        #Bem-vindo(a) ao CLUBE AIWA. 
        #Aqui você tem uma ferramenta para atingir a excelência e performance nas vendas, contando com um programa completo de recompensas. 
        #Escolha inteligente é contar com a gente! 


@manual
@Tarefa_#:#59194
@Falha_de_Execução_#60713
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Primeiro_acesso_CPF_INATIVO.png),[Evidência_2](assets/B_Primeiro_acesso_CPF_SUSPENSO_TEMPORARIAMENTE.png),[Evidência_3](assets/B_Primeiro_acesso_CPF_ATIVO.png)
    Esquema do Cenário: Primeio Acesso -  Status diferente de Cadastro Pendente
        Dado que o usuário acionou o botão "Quero me cadastrar"
        Quando preencher com um "<CPF>" cadastrado na base de dados para essa campanha
        Mas com "<Status>" diferente de Ativo
        E acionar o botão "Validar"  
        Então o sistema sinaliza com a mensagem em um modal "<Mensagem do Sistema>"
        E não avança para o formulário de "Primeiro Acesso", mantendo o usuário na mesma tela após fechar o modal
            Exemplos:
            | <CPF>          | <Status>                 | <Mensagem do Sistema>                                                   |
            | 000.000.000-00 | Inativo                  | Falha de Autenticação                                                   |
            | 999.999.999-99 | Cadastro Pendente        | Usuário e/ou senha inválidos                                            | 
            | 333.333.333-33 | Suspenso Temporariamente | Falha de autenticação. Entre em contato com o administrador da campanha |
            | 222.222.222-22 | Ativo                    | CPF já cadastrado. Clique em "Login" ou em "Esqueceu sua senha?"        |
    #verificar máscara de CPF no campo
    #dados fictícios, utilizar conforme base da campanha no momento do teste
    #desconsiderar linha 3 da tabela



@manual
@Tarefa_#:#59194
@Falha_de_Execução_#60713
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Primeiro_acesso_CPF_nao_cadastrado.png)
    Cenário: Primeio Acesso - CPF não cadastrado na base
        Dado que o usuário acionou o botão "Quero me cadastrar"
        Quando digitar um CPF não cadastrado na base de dados para essa campanha
        E acionar o botão "Validar" 
        Então o sistema sinaliza com a mensagem "Falha de Autenticação. Entre em contato com o administrador da campanha."



@manual
@Tarefa_#:#59194
@Ajuste_#60714
@Sugestão_#60722
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Primeiro_acesso_CPF_travado.png),[Evidência_2](assets/B_Primeiro_acesso_informar_CPF.mp4)
    Cenário: Primeio Acesso - Acessar Formulário, Layout e Cancelar
        Dado que o usuário acionou o botão "Quero me cadastrar"
        E preencheu com um "CPF" cadastrado com status 3 "Cadastro Pendente" na campanha
        Quando acionar o botão "Validar" 
        Então o sistema redireciona o usuário para o formulário de "Primeiro Acesso"
        E o "CPF" virá preenchido com o documento informado na etapa anterior
        E o campo CPF será bloqueado para edição no formulário de "Primeiro Acesso"
        Quando o usuário visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o usuário acionar o botão "Cancelar" dentro do formulário
        Então o sistema redireciona o usuário de volta para a etapa dos banners, sendo a "1º etapa da área deslogada"



@manual
@Tarefa_#:#59194
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Primeiro_acesso_sem_nome.png),[Evidência_2](assets/B_Primeiro_acesso_sem_dn.png),[Evidência_3](assets/B_Primeiro_acesso_sem_email.png),[Evidência_4](assets/B_Primeiro_acesso_sem_cell.png),[Evidência_5](assets/B_Primeiro_acesso_sem_CEP.png),[Evidência_6](assets/B_Primeiro_acesso_sem_ENDEREÇO.png),[Evidência_7](assets/B_Primeiro_acesso_sem_numero.png),[Evidência_8](assets/B_Primeiro_acesso_sem_bairro.png),[Evidência_9](assets/B_Primeiro_acesso_sem_UF.png),[Evidência_10](assets/B_Primeiro_acesso_sem_senha.png),[Evidência_11](assets/B_Primeiro_acesso_sem_confirmacao_senha.png),[Evidência_12](assets/B_Primeiro_acesso_sem_flag_LGPD.png)
    Esquema do Cenário: Primeio Acesso - Não preenchendo os campos obrigatórios
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Mas não preencher mais nenhum campo do formulário além do CPF que já está preenchido com o documento informado na etapa anterior, OU deixar um campo obrigatório vazio
        Quando acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza com a mensagem "Preencha este campo" em cada campo obrigatório
        Exemplos:
            | <Nome>  | <Data de nascimento> | <E-mail> | <Celular> | <CEP>   | <Endereço> | <Número> | <Bairro> | <Estado> | <Cidade> | <Senha> | <Confirme a senha> | <Flag Termos da LGPD> |
            | 'vazio' | 'vazio'              | 'vazio'  | 'vazio'   | 'vazio' | 'vazio'    | 'vazio'  | 'vazio'  | 'vazio'  | 'vazio'  | 'vazio' | 'vazio'            | 'vazio'               |
            | 'VAZIO' | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'VAZIO'              | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'VAZIO'  | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'VAZIO'   | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'VAZIO' | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'VAZIO'    | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'VAZIO'  | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'VAZIO'  | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'VAZIO'  | 'OK'     | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'VAZIO'  | 'OK'    | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'VAZIO' | 'OK'               | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'VAZIO'            | 'OK'                  |
            | 'OK'    | 'OK'                 | 'OK'     | 'OK'      | 'OK'    | 'OK'       | 'OK'     | 'OK'     | 'OK'     | 'OK'     | 'OK'    | 'OK'               | 'VAZIO'               |



@manual
@Tarefa_#:#59194
@manual-result:success
@manual-last-tested:03-01-2022
@manual-test-evidence:[Evidência_1](assets/B_Primeiro_acesso_nome_incompleto.png),[Evidência_2](assets/B_Primeiro_acesso_dn_invalida.png),[Evidência_3](assets/B_Primeiro_acesso_dn_menor18anos.png),[Evidência_4](assets/B_Primeiro_acesso_email_invalido.png),[Evidência_5](assets/B_Primeiro_acesso_cell_invalido.png),[Evidência_6](assets/B_Primeiro_acesso_cell_invalido_2.png),[Evidência_7](assets/B_Primeiro_acesso_CEP_invalido.png),[Evidência_8](assets/B_Primeiro_acesso_senha_menor8dig.png),[Evidência_9](assets/B_Primeiro_acesso_senha_divergente.png)
    Esquema do Cenário: Primeio Acesso - Campos inválidos do formulário
        Dado que o usuário está no formulário de "Primeiro Acesso"
        Quando preencher valores inválidos nos campos do formulário
        E acionar o botão "Finalizar Cadastro"
        Então o sistema sinaliza conforme cada mensagem "<Resposta do sistema>"
            Exemplos:
            | <Campos>             | <Valor Inválido>             | <Resposta do sistema>                                            |
            | <Nome>               | 'Teste'                      | Informe nome e sobrenome                                         |
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
            | <Senha>              | '12345678'                   | 'As senhas informadas são diferentes. Verifique'                 |
            | <Confirme a senha>   | '1234567890'                 | 'As senhas informadas são diferentes. Verifique'                 |


@manual
@Tarefa_#:#59194
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Primeiro_acesso_email_duplicado.png),[Evidência_2](assets/B_Primeiro_acesso_cell_duplicado.png)
    Cenário: Primeio Acesso - Dados duplicados
        Dado que já existe na base desta campanha as informações abaixo para usuário de qualquer status
            | Email              | Celular         | 
            | teste@teste.com.br | (19) 99111-9911 |
        Quando um usuário acessar o formulário de "Primeiro Acesso"
        E preencher nos campos "Email" e "Celular" essas mesmas informações
        E acionar o botão "Finalizar Cadastro"
        Então o sistema  vai exibir a mensagem "E-mail já cadastrado" e "Celular já cadastrado"
        E não vai cadastro esse novo usuário, impedindo duplicadade de email e celular na base da campanha
        #deixar esses valores em dois usuários já existentes na base > ir alterando o status para que o sistema impeça o novo cadastro em tds os status


@manual
@Tarefa_#:#59194
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Primeiro_acesso_CEP_valido.png)
    Cenário: Primeio Acesso - Validação de CEP com preenchimento dos campos de endereço
        Dado que o usuário está no formulário de "Primeiro Acesso" 
        Quando preencher um "CEP" válido
        E der um 'tab' ou mudar de campo
        Então o sistema preenche os campos "Endereço", "Bairro", "Cidade" e "Estado" confome "CORREIOS"



@manual
@Tarefa_#:#59194
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Primeiro_acesso_sucesso.webm)
    Cenário: Primeio Acesso - Finalizar Cadastro
        Dado que o usuário está no formulário de "Primeiro Acesso"
        E preencheu corretamente todos os campos
        Quando clicar no botão "Finalizar Cadastro"
        Então o sistema exibe um modal de sucesso com a mensagem 
        |"Cadastro Concluído"|
        |Seu cadastro foi ativado com sucesso"|
        |Agora você já pode fazer login na nossa plataforma.|
        E redireciona o usuário para a home da área deslogada do Banking #ou para a tela de login direto
        

@manual
@Tarefa_#:#59194
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Home_aceite_de_termos.png)
    Cenário: Primeio Acesso - Aceite de Regulamento
        Dado que o usuário fez seu cadastro de "Primeiro Acesso"
        Quando fizer seu login pela primeira vez na plataforma Banking
        Então a primeira tela que lhe será apresentada é a do "Regulamento" com um PDF para leitura e/ou download
        E uma flag para aceite
        E um botão "Aceitar"
        Quando o usuário acionar o botão "Aceitar" sem ter marcado a flag
        Então o sistema exibe um alerta na flag para ser marcada
        E o usuário não conseguirá trocar de tela através dos menus ou url enquanto não marcar a flag e Aceitar, mesmo que em novos logins, ficando "preso" no Regulamento até o devido aceite
        Quando o usuário marcar a flag
        E acionar o botão "Aceitar"
        Então o sistema registra o aceite do usuário na tabela account_agree_terms_log
        E altera o registro dessa account na tabela account_agree_terms como para não solicitar novo aceite #só torna pedir aceite, se houver mudança na tabela account_agree_terms.agree (1 não pede aceite e 0 pede)
        E redireciona o usuário para a home da campanha liberando sua navegação 


#10 CN