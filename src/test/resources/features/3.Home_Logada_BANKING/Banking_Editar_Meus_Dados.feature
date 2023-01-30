#language: pt

Funcionalidade: Banking - Minha Conta - Editar meus dados
 Como usuário cadastrado e ativo na campanha
 Quero acessar a edião dos meus dados
 Para atualizar meu cadastro


Critérios de Aceitação:
 Não é permitido alterar o CPF
 O usuário precisa ter vínculo com um Distribuidor, pois é utilizado na segmentação dos módulos
 O usuário precisa ter um cargo pré configurado, pois é utilizado na segmentação dos módulos
 O email precisa ser reconhecido como tal
 O email não será mais validado com a base de dados
 Não pode ter duplicidade de email
 Não pode ter duplicidade de Celular
 É obrigatório nome com mín 3 e sobrenome com mín 2 caracteres
 Precisa ter 18 anos ou mais 
 A data de nascimento precisa ser válida no calendário
 O endereço é preenchido pelo sistema conforme CEP digitado pelo usuário
 Gênero e Estado Civil não existem mais na edição dos dados do usuário

SELECT * FROM `account ` where document = '' ;
---
 
@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Meus Dados - Acessar, Layout e Cancelar
        Dado que o usuário está logado no "Banking"
        Quando clicar no menu principal
        E clicar no submenu  "Minha Conta " > "Editar Menus Dados"
        Então o sistema redireciona o usuário para o formulário com os dados cdastrais do usuário logado
    	Quando o usuário visualizar todos os elementos da tela com ID e CPF bloqueados para edição
    	Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs                    | Minha Conta / Meus Dados                                                                    |
            | Seção Dados Pessoais           | Contendo os campos "CPF", "Nome" e "Data de Nascimeto"                                      |
            | Seção “Informações de contato” | Contendo o campo "Celular"                                                                  |
            | Seção “Endereço”               | Contendo os campos "Cep", "Endereço", "Número", "Complemento", "Bairro", "Estado", "Cidade" |
            | Botão "Cancelar"               | redireciona pra a home banking                                                              |
            | Botão "Salvar"                 | valida os campos e salva                                                                    |
        Quando o usuário acionar o botão "Cancelar" 
        Então o sistema vai redirecionar para "Home banking"



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Editar Meus Dados - Não preenchendo os campos obrigatórios
        Dado que o usuário está na tela de "Meus Dados"
        Quando acionar o botão "Salvar"
        Mas não preencher/remover os valores dos campos "<Nome>", "<Nascimento>", "<Celular>", "<CEP>", "<Endereço>", "<Número>", "<Bairro>", "<Estado>", "<Cidade>"
        E clicar em Salvar
        Então o sistema sinaliza um alerta com a mensaem "<Mensagem do Sistema>" 
            Exemplos:
            | Nome          | Nascimento | Celular     | CEP      | Endereço  | Número | Bairro | Estado    | Cidade    | Mensagem do sistema          |
            |               | 01/01/2000 | 11989898988 | 13471240 | Rua Teste | 123    | Centro | São Paulo | Americana | Informe nome e sobrenome     |
            | Usuário Teste |            | 11989898988 | 13471240 | Rua Teste | 123    | Centro | São Paulo | Americana | Informe a data de nascimento |
            | Usuário Teste | 01/01/2000 |             | 13471240 | Rua Teste | 123    | Centro | São Paulo | Americana | Informe o celular            |
            | Usuário Teste | 01/01/2000 | 11989898988 |          | Rua Teste | 123    | Centro | São Paulo | Americana | Informe o CEP                |
            | Usuário Teste | 01/01/2000 | 11989898988 | 13471240 |           | 123    | Centro | São Paulo | Americana | Informe o endereço           |
            | Usuário Teste | 01/01/2000 | 11989898988 | 13471240 | Rua Teste |        | Centro | São Paulo | Americana | Informe o número do endereço |
            | Usuário Teste | 01/01/2000 | 11989898988 | 13471240 | Rua Teste | 123    |        | São Paulo | Americana | Informe o bairro             |
            | Usuário Teste | 01/01/2000 | 11989898988 | 13471240 | Rua Teste | 123    | Centro |           | Americana | Informe o estado             |
            | Usuário Teste | 01/01/2000 | 11989898988 | 13471240 | Rua Teste | 123    | Centro | São Paulo |           | Informe a cidade             |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Editar Meus Dados - Campos inválidos
        Dado que o usuário está na tela de "Meus Dados"
        Quando preencher valores inválidos nos campos do formulário
        E clicar o botão "Salvar"
        Então o sistema sinaliza conforme cada mensagem "<Resposta do sistema>"
            Exemplos:
            | <Campo>              | <Valor Inválido>                   | <Resposta do sistema>                                                               |
            | <Nome>               | 'Teste'                            | Informe nome e sobrenome                                                            |
            | <Data de nascimento> | '31/02/2000'                       | Data inválida                                                                       |
            | <Data de nascimento> | '31/15/2000'                       | Data inválida                                                                       |
            | <Data de nascimento> | 'letra e caractere especial'       | Bloquear digitação                                                                  |
            | <Data de nascimento> | '31/01/2020'                       | Para participar desta campanha, você precisa ter mais de 18 anos                    |
            | <Data de nascimento> | '31/01/2023'                       | Para participar desta campanha, você precisa ter mais de 18 anos                    |
            | <E-mail>             | 'xpto'                             | E-mail inválido                                                                     |
            | <E-mail>             | 'já existente na base da campanha' | E-mail já cadastrado                                                                |
            | <Celular>            | '(19) 888'                         | Celular inválido                                                                    |
            | <Celular>            | '(99) 99999-9999'                  | Celular inválido                                                                    |
            | <Celular>            | '(19) 88899-99'                    | Celular inválido                                                                    |
            | <Celular>            | 'já existente na base da campanha' | Celular já cadastrado                                                               |
            | <CEP>                | '13471-2'                          | 'CEP inválido'                                                                      |
            | <CEP>                | '11.111-111'                       | 'CEP não encontrado'                                                                |
            | <CEP>                | '11.111-111'                       | 'CEP não localizado. Se estiver correto, informe os campos de endereço manualmente' |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Editar Meus Dados - Alterar Dados com informações válidas
        Dado que o usuário está na tela de "Meus Dados"
        E editou corretamente um campo ou todos os campos
        Quando clicar no botão "Salvar"
        Então o sistema sinaliza com um modal de sucesso "Dados alterados com sucesso!"
        E mantém o usuário na mesma tela
        Exemplos:
            | Nome            | Nascimento | Celular         | CEP       | Endereço           | Número    | Complemento          | Bairro | Estado    | Cidade     |
            | Novo nome teste | 18/08/1963 | (19) 98989-0555 | 13471-240 | Rua Teste Alterado | 123-- abc | Complemento alterado | Leste  | Americana | São Paulo  |
    #dados fictícios, utilizar qlq outro para teste

#4 CN