#language: pt

Funcionalidade: Admin - Cadastro e Edição de Usuários 
Como usuário administrador ativo na Plataforma
Quero acessar a tela de de Usuários
Para realizar cadastro e edições do usuários da campanha

-----

Critérios de Aceitação:
Acesso através da listagem de Usuários
No formulário de cadastro - Exibir breadcrumb: "Gerencial / Usuários / Cadastrar"
No formulário de cadastro - Os campos que compõem a seção 'Dados' de preenchimento obrigatório são: "CPF", "CNPJ da Revenda", "Cargo" e "Status" #Rede foi removida pelo Sono do cadastro no alinhamento de estimativa com o dev
No formulário de cadastro - Os campos que compõem a seção 'Dados' com preenchimento opcional são: "Nome", "Data de nascimento", "E-mail", "Celular", "CEP", "Endereço", "Número", "Complemento", "Bairro", "Cidade" e "Estado" 
No formulário de cadastro - Exibir os botões: "Cancelar" e "Salvar"
No select "CNPJ da Revenda" exibir somente as cadastradas para esta campanha, mas todas independente do Status
No select "Cargo" listar as opções: "Vendedor", "Gerente", "Subgerente", "Supervisor" e "Gerente Regional"
Para o cadastro - O "CPF" deve ser válido
Para o cadastro - O "CPF" deve ser único na campanha, independente do status
Para o cadastro - O nome precisa ser completo,  com nome e sobrenome
Para o cadastro - A data de nascimento deve ser válida no calendário
Para o cadastro - Na data de nascimento, a idade atual do usuário que ser igual ou maior a 18 anos
Para o cadastro - Não permitir duplicidades de "E-mail" para a mesma campanha, independente do status dos usuários
Para o cadastro - Não permitir duplicidades de "Celular" para a mesma campanha, independente do status dos usuários
Para o cadastro - E email precisa ter formato válido xxx@xx.xx
Para o cadastro - Ao preencher um CEP válido, o "Endereço", "Bairro", "Cidade" e "Estado" são preenchidos automaticamente conforme Correios
No formulário de cadastro  - Botão "Cancelar" interrompe e não realiza o cadastro e redireciona para a listagem de Usuários
No formulário de cadastro  - Botão "Salvar" faz as validações em todos os campos e retorna com as críticas necessárias
No formulário de cadastro  - Botão "Salvar" quando não existem críticas, realiza o cadastro respectiva campanha e redireciona para a listagem de Usuários
Edição acessar através da opção "Editar" dentro de "Ações" na listagem de Usuários
Na edição - o "CPF" é exibido apensa para leitura
Na edição - Disponibilizar o botão "Gerar nova senha"
Na edição - todos os campos vem preenchidos conforme cadastrado
Na edição - Os campos editáveis são: "CNPJ da Revenda", "Cargo", "Status", "Nome", "Data de nascimento", "E-mail", "Celular"  "CEP", "Endereço", "Número", "Complemento", "Bairro", "Cidade" e "Estado"  
Na edição - Ao alterar alguma informação e salvar, as informações do usuário são atualizadas
Na edição - Todas as regras de cadastro precisam ser validadas novamente.
Botão Gerar nova senha - Quando acionado, exibe um modal com uma senha temporária para o usuário fazer login
Botão Gerar nova senha - Quando acionado, dispara um email ao usuário com um comunicado da ação e com a senha gerada
Botão Gerar nova senha - Quando acionado e o usuário realizar seu login no banking, redireciona-o para a tela de nova senha, obrigando-o a alterar sua senha

---


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro - Acessar, validar Layout e Cancelar
        Dado que o admin esta na tela de "Usuários"
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona o admin para a tela de "Cadastro de Usuários"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Usuários"




@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Cadastro - Campos obrigatórios não preenchidos
        Dado que o admin esta na tela de "Cadastro de Usuários"
        Quando NÃO preencher os campos obrigatórios "<CPF>", "<CNPJ da Revenda>", "<Cargo>" e "<Status>"
        E acionar o botão "Salvar"
        Então o sistema alerta a obrigatoriedade de cada campo conforme "<Resposta do sistema>"
            Exemplos:
            | <CPF>          | <CNPJ da Revenda>            | <Cargo>  | <Status>          | Resposta do sistema |
            |                | '77.045.108/0001-25 - Teste' | Vendedor | Cadastro Pendente | Informe o CPF.      |
            | 348.108.998.88 |                              | Vendedor | Cadastro Pendente | Informe a revenda.  |
            | 348.108.998.88 | '77.045.108/0001-25 - Teste' |          | Cadastro Pendente | Informe o cargo.    |
            | 348.108.998.88 | '77.045.108/0001-25 - Teste' | Gerente  |                   | Informe o Status.   |
            #informações são somente de exemplo


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Cadastro - Campos inválidos ou duplicados
        Dado que o admin esta na tela de "Cadastro de Usuários"
        Quando preencher  com valores inválidos ou já existentes os campos "<CPF>", "<Nome>", "<Data de Nascimento>", "<E-mail>", "<Celular>" e "<CEP>"
        E acionar o botão "Salvar"
        Então o sistema alerta em cada campo conforme "<Resposta do sistema>"
            Exemplos:
            | <CPF>            | <Nome>       | <Data de Nascimento> | <E-mail>              | <Celular>                     | <CEP>       | Resposta do sistema                                                                                                                              |
            | 'já existente'   | Cintia Teste | 04/05/1989           | teste0@teste.com.br   | (99)99999-9990                | 13471-240   | CPF já cadastrado;                                                                                                                               |
            | '348.108.998.89' | Cintia Teste | 04/05/1989           | teste1@teste.com.br   | (99)99999-9991                | 13471-240   | CPF inválido. Verifique;                                                                                                                         |
            | 348.108.998.88   | 'Teste'      | 04/05/1989           | teste2@teste.com.br   | (99)99999-9992                | 13471-240   | Informe o seu nome completo;                                                                                                                     |
            | 348.108.998.88   | Cintia Teste | '31/02/1989'         | teste3@teste.com.br   | (99)99999-9993                | 13471-240   | Data inválida;                                                                                                                                   |
            | 048.243.446-54   | Cintia Teste | '10/10/2008'         | teste4@teste.com.br   | (99)99999-9994                | 13471-240   | Para participar desta campanha você precisa ter mais de 18 anos;                                                                                 |
            | 048.243.446-54   | Cintia Teste | 04/05/1989           | 'já@existente.com.br' | (99)99999-9995                | 13471-240   | E-mail já cadastrado;                                                                                                                            |
            | 048.243.446-54   | Cintia Teste | 04/05/1989           | 'testando'            | (99)99999-9996                | 13471-240   | E-mail inválido;                                                                                                                                 |
            | 048.243.446-54   | Cintia Teste | 04/05/1989           | teste@teste.com.br    | 'já existente'                | 13471-240   | Celular já cadastrado;                                                                                                                           |
            | 048.243.446-54   | Cintia Teste | 04/05/1989           | teste@teste.com.br    | '(99)98989-05'                | 13471-240   | Número de celular inválido;                                                                                                                      |
            | 048.243.446-54   | Cintia Teste | 04/05/1989           | teste@teste.com.br    | 'texto ou caractere especial' | 13471-240   | Sistema bloqueia a digitação;                                                                                                                    |
            | 048.243.446-54   | Cintia Teste | 04/05/1989           | teste@teste.com.br    | (99)99999-9997                | '13471'     | O CEP deve conter 8 dígitos                                                                                                                      |
            | 048.243.446-54   | Cintia Teste | 04/05/1989           | teste@teste.com.br    | (99)99999-9997                | '00000-000' | CEP não localizado. Se estiver correto, preencha os demais campos de endereço manualmente [e não preenche automaticamente os campos do endereço] |



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro - Campos Válidos
        Dado que o admin esta na tela de "Cadastro de Usuários"
        Quando preencher dados válidos e sem duplicidades
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Usuário cadastrado com sucesso"
        E salva o usuário nesta campanha conforme dados pessoais, status, cargo e revenda definidos
        E redireciona o admin de volta para a listagem de "Usuários"
    

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Acesso, Layout e Cancelar
        Dado que o admin esta na tela de "Usuários"
        Quando acionar a opção "Alterar" dentro de "Ações" na listagem das Usuários
        Então o sistema redireciona o admin para a tela de "Edição de Usuário" exibindo o ID do respectivo usuário na url
        E todos os dados já cadastrados são exibidos já preenchidos
        Mas o 'CPF' é exibido bloqueado para edição
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Usuários"



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Alterar o ID de outra camapnha na url
        Dado que o admin está na tela de "Edição do Usuário" com o ID do respectivo usuário na url
        Quando alterar na url para o ID da "account" de outra campanha
        E der "Enter"
        Então o sistema redireciona de volta para a tela de "Usuários" impedindo a alteração em outra campanha



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Adicionar dados não obrigatórios
        Dado que o admin está na tela de "Edição do Usuário"
        E esse usuário já possui campos opcionais cadastrados
        Quando o admin preencher com válores válidos os campos "Nome", "Data de nascimento", "E-mail" e "Celular"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas
        E redireciona o admin de volta para a listagem de "Usuários"
        Quando o admin acessar novamente a opção "Editar" deste Usuário
        Então os dados exibidos estarão conforme edições realizadas



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Deletar dados não obrigatórios e Salvar
        Dado que o admin está na tela de "Edição do Usuário"
        E esse usuário já possui endereço definido
        Quando o admin 'deletar' os dados nos campos "Nome", "Data de nascimento", "E-mail" e "Celular"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas 
        E redireciona o admin de volta para a listagem de "Usuários"
        Quando o admin acessar novamente a opção "Editar" deste Usuário
        Então os dados exibidos estarão conforme edições realizadas, sem essas informações

  

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Inserir endereço e Salvar
        Dado que o admin está na tela de "Edição do Usuário"
        E esse usuário não possui endereço definido
        Quando o admin inserir um "CEP" válido, ao dar 'tab' ou mudar de campo
        Então os campos são preenchidos automáticamente "Endereço", "Complemento", "Bairro", "Cidade", "Estado"
        Quando acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas 
        E redireciona o admin de volta para a listagem de "Usuários"
        Quando o admin acessar novamente a opção "Editar" deste Usuário
        Então os dados exibidos estarão conforme edições realizadas, com novo endereço




@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Deletar endereço e Salvar
        Dado que o admin está na tela de "Edição do Usuário"
        E esse usuário já possui endereço definido
        Quando o admin 'alterar' os dados nos campos "CEP", "Endereço", "Complemento", "Bairro", "Cidade", "Estado"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas
        E redireciona o admin de volta para a listagem de "Usuários"
        Quando o admin acessar novamente a opção "Editar" deste Usuário
        Então os dados exibidos estarão conforme edições realizadas, sem endereço



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Editar - Campos obrigatórios não preenchidos
        Dado que o admin está na tela de "Edição do Usuário"
        Quando deletar os campos obrigatórios  "<CNPJ da Revenda>", "<Cargo>" e "<Status>"
        E acionar o botão "Salvar"
        Então o sistema alerta a obrigatoriedade de cada campo conforme "<Resposta do sistema>"
            Exemplos:
            | <CNPJ da Revenda>            | <Cargo>  | <Status>          | Resposta do sistema |
            |                              | Vendedor | Cadastro Pendente | Informe a revenda.  |
            | '77.045.108/0001-25 - Teste' |          | Cadastro Pendente | Informe o cargo.    |
            | '77.045.108/0001-25 - Teste' | Gerente  |                   | Informe o Status.   |
            #informações são somente de exemplo


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Editar - Campos inválidos ou duplicados
        Dado que o admin esta na tela de "Edição de Usuários"
        Quando preencher com valores inválidos ou já existentes os campos "<Nome>", "<Data de Nascimento>", "<E-mail>", "<Celular>" e "<CEP>"
        E acionar o botão "Salvar"
        Então o sistema alerta em cada campo conforme "<Resposta do sistema>"
            Exemplos:
            | <Nome>       |<Data de Nascimento>| <E-mail>              | <Celular>                     | <CEP>       | Resposta do sistema                                                                                                                              |
            | Cintia Teste | 04/05/1989         | teste0@teste.com.br   | (99)99999-9990                | 13471-240   | CPF já cadastrado;                                                                                                                               |
            | Cintia Teste | 04/05/1989         | teste1@teste.com.br   | (99)99999-9991                | 13471-240   | CPF inválido. Verifique;                                                                                                                         |
            | 'Teste'      | 04/05/1989         | teste2@teste.com.br   | (99)99999-9992                | 13471-240   | Informe o seu nome completo;                                                                                                                     |
            | Cintia Teste | '31/02/1989'       | teste3@teste.com.br   | (99)99999-9993                | 13471-240   | Data inválida;                                                                                                                                   |
            | Cintia Teste | '10/10/2008'       | teste4@teste.com.br   | (99)99999-9994                | 13471-240   | Para participar desta campanha você precisa ter mais de 18 anos;                                                                                 |
            | Cintia Teste | 04/05/1989         | 'já@existente.com.br' | (99)99999-9995                | 13471-240   | E-mail já cadastrado;                                                                                                                            |
            | Cintia Teste | 04/05/1989         | 'testando'            | (99)99999-9996                | 13471-240   | E-mail inválido;                                                                                                                                 |
            | Cintia Teste | 04/05/1989         | teste@teste.com.br    | 'já existente'                | 13471-240   | Celular já cadastrado;                                                                                                                           |
            | Cintia Teste | 04/05/1989         | teste@teste.com.br    | '(99)98989-05'                | 13471-240   | Número de celular inválido;                                                                                                                           |
            | Cintia Teste | 04/05/1989         | teste@teste.com.br    | 'texto ou caractere especial' | 13471-240   | Sistema bloqueia a digitação;                                                                                                                    |
            | Cintia Teste | 04/05/1989         | teste@teste.com.br    | (99)99999-9997                | '13471'     | O CEP deve conter 8 dígitos                                                                                                                      |
            | Cintia Teste | 04/05/1989         | teste@teste.com.br    | (99)99999-9997                | '00000-000' | CEP não localizado. Se estiver correto, preencha os demais campos de endereço manualmente [e não preenche automaticamente os campos do endereço] |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Campos Válidos
        Dado que o admin esta na tela de "Edição de Usuários"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Usuário alterado com sucesso"
        E grava as alterações do usuário
        E redireciona o admin de volta para a listagem de "Usuários"



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Gerar nova Senha
        Dado que o admin esta na tela de "Edição de Usuários"
        Quando acionar o botão "Gerar nova senha"
        Então o sistema exibe um modal de "Sucesso" com uma senha temporária para o usuário fazer login
        |Nova senha gerada: 88888888|
        E "dispara um email ao usuário" com um comunicado da ação e com a temporária senha gerada
        Quando o usuário "faz login no banking" com essa "senha temporária"
        Então o sistema direciona o usuário automaticamente para a tela de "nova senha"
        E é necessário que o usuário realize o cadastro de uma nova senha para prosseguir e conseguir logar no banking
        E a nova senha segue a mesma regra padrão de ser igual ou maior que 8 dígitos
        E no cadastro ambas devem ser iguais
        Mas se o usuário acionar o botão "Cancelar"
        Então o sistema o direciona novamente para tela de login
        Quando no cadastro na nova sneha o usuário não preencher corretamente os campos "Nova Senha" e "Confirmar Senha"
        E acionar o botão "Salvar"
        Então o sistema exibe as críticas de "campos obrigatórios" ou "A senha deve conter no mínimo 8 dígitos" ou "As senhas informadas são diferentes. Verifique"
        Quando o usuário cadastrar corretamemte uma nova senha
        E acionar o botão "Salvar"
        Então o sistema atualiza a senha do usuário
        E sinaliza com um modal "Senha alterada com sucesso"
        E o redireciona para "Home banking" já logado
        #ou 
        #E sinaliza com um modal "Senha alterada com sucesso, faça se login"
        #E redireciona o usuário para a tela de login
        E se o usuário tentar usar novamente a senha temporária, o sistema irá exibir alerta de "Usuário e/ou senha inválidos"



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Log de Cadastro e Edição em BD 
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos:
            | ID (registro do banco)                   |
            | Ação executada (cadastro, alteração etc.)|
            | Campo (Nome, Status etc.);               |
            | logs de exclusão de Administrador        |
            | Data e hora do cadastro e/ou alterações  |
            | admin que cadastrou e/ou alterou/excluiu |
            | IP do computador do admin que fez a ação |

#15 cn