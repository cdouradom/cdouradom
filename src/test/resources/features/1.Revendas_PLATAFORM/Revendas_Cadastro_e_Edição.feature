#language: pt

Funcionalidade: Admin - Cadastro e Edição de Revendas 
Como usuário administrador ativo na Plataforma
Quero acessar a tela de de Revendas
Para realizar cadastro e dições

-----

Critérios de Aceitação:
Exibir breadcrumb: "Gerencial / Revendas / Cadastrar"
Acessado através da listagem de Revendas
Formulário de cadastro possui os campos: "CNPJ", "Grupo", "Rede", "Nome Fantasia", "Razão Social", "Categoria", "Regional", "Cep", "Endereço", "Número", "Complemento", "Bairro", "Cidade", "Estado", "Sattus"
Exibir os botões: "Cancelar" e "Salvar"
Nos campos "Rede" e "Grupo" listar somente os cadastrados para esta campanha
Listar no select "Categoria" as opções: "Varejo" e "Atacado"
No select "Regional" listas as opções abaixo #confirmar lista correta de regionais, tem duas listas no escopo
    - Centro-Oeste - Distrito Federal 
    - Centro-Oeste - Goiás 
    - Centro-Oeste - Mato Grosso 
    - Centro-Oeste - Mato Grosso do Sul 
    - Nordeste - Alagoas 
    - Nordeste - Bahia 
    - Nordeste - Ceará 
    - Nordeste - Maranhão 
    - Nordeste - Paraíba 
    - Nordeste - Pernambuco 
    - Nordeste - Piauí 
    - Nordeste - Rio Grande do Norte 
    - Nordeste - Sergipe 
    - Norte - Acre 
    - Norte - Amapá 
    - Norte - Amazonas 
    - Norte - Pará 
    - Norte - Rondônia 
    - Norte - Roraima 
    - Norte - Tocantins 
    - Sudeste - Espírito Santo 
    - Sudeste - Minas Gerais 
    - Sudeste - Rio de Janeiro 
    - Sudeste - São Paulo 
    - Sul - Paraná
    - Sul - Rio Grande do Sul 
    - Sul - Santa Catarina 
Todos os selects trazer por default a opção selecione, mas a opção selecionada deve ser diferente do default
O "CNPJ" deve ser válido
Não permitir duplicidades de "CNPJ" para diferentes revendas da mesma campanha
Os campos que compõem a seção 'Dados' que tem preenchimento obrigatório são: "CNPJ", "Grupo", "Rede", "Nome Fantasia", "Razão Social", "Categoria", "Regional" e "Status"
Os campos que compõem a seção 'Dados' que não são de preenchimento obrigatório: "CEP", "Endereço", "Número", "Complemento", "Bairro", "Cidade", "Estado"
Ao informar um CEP válido nos Correios os campos de endereço, bairro, cidade e Estado tem preenchimento automático
Botão "Cancelar" interrompe e não realiza o cadastro e redireciona para a listagem de Revendas
Botão "Salvar" faz as validações em todos os campos e retorna com as críticas necessárias
Botão "Salvar" realiza o cadastro da Revenda na respectiva campanha e redireciona para a listagem de Revendas
Edição acessar através da opção "Editar" na coluna "Ações" da listagem de Revendas
Na edição o "CNPJ" é exibido apensa para leitura
Na edição todos os campos vem preenchidos conforme já cadastrados
Os campos editáveis são:  "Grupo", "Rede", "Nome Fantasia", "Razão Social", "Categoria", "Regional", "CEP", "Endereço", "Número", "Complemento", "Bairro", "Cidade", "Estado" e "Status"
Ao alterar alguma informação e salvar, as informações da revenda são atualizadas

--- 

@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](src\test\resources\assets\A_Revenda_cadastar_layout.mp4)
    Cenário: Cadastro de Revenda - Acessar, validar Layout e Cancelar
        Dado que o admin esta na tela de "Revendas"
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona o admin para a tela de "Cadastro de Revendas"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o admin digitar no select dos campos "Rede" e "Grupo" um termo existente nesta campanha
        Então a listagem funciona com autocomplete, filtrando "Rede" e/ou "Grupo" conforme o termo digitado
        Quando o admin digitar um termo que não existe, por exemplo: "Sol"
        Então não terá resultado encontrado
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Revendas"


@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:
@manual-test-evidence:[Evidência](assets/A_Revenda_cadastro_sem_nada.png),[Evidencia_2](assets/A_Revenda_cadastro_sem_CNPJ.png),[Evidencia_3](assets/A_Revenda_cadastro_sem_rede.png),[Evidencia_4](assets/A_Revenda_cadastro_sem_grupo.png),[Evidencia_5](assets/A_Revenda_cadastro_sem_nf.png),[Evidencia_6](assets/A_Revenda_cadastro_sem_rs.png),[Evidencia_7](assets/A_Revenda_cadastro_sem_regional.png),[Evidencia_8](assets/A_Revenda_cadastro_sem_categoria.png),[Evidencia_8](assets/A_Revenda_cadastro_sem_status.png)
    Esquema do Cenário: Cadastro de Revenda - Campos obrigatórios não preenchidos
        Dado que o admin esta na tela de "Cadastro de Revendas"
        Quando NÃO preencher os campos "<CNPJ>", "<Rede>", "<Grupo>", "<Nome Fantasia>", "<Razão Social>", "<Categoria>", "<Regional>" e "<Status>"
        E acionar o botão "Salvar"
        Então o sistema alerta a obrigatoriedade de cada campo conforme "<Resposta do sistema>"
        Exemplos:
            | CNPJ           | Rede       | Grupo      | Nome Fantasia | Razão Social     | Categoria | Regional | Status | Resposta do sistema                                                                                                                                                |
            |                |            |            |               |                  |           |          |        | Informe o CNPJ ; Informe a rede ; Informe o grupo ; Informe o nome fantasia ; Informe a razão social ; Informe a categoria ; Informe a regional ; Informe o status |
            |                | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Varejo    | Sul      | Ativo  | Informe o CNPJ                                                                                                                                                     |
            | 78115012000159 |            | "da lista" | Revenda Teste | Testando Revenda | Varejo    | Sul      | Ativo  | Informe a rede                                                                                                                                                     |
            | 78115012000159 | "da lista" |            | Revenda Teste | Testando Revenda | Varejo    | Sul      | Ativo  | Informe o grupo                                                                                                                                                    |
            | 78115012000159 | "da lista" | "da lista" |               | Testando Revenda | Varejo    | Sul      | Ativo  | Informe o nome fantasia                                                                                                                                            |
            | 78115012000159 | "da lista" | "da lista" | Revenda Teste |                  | Varejo    | Sul      | Ativo  | Informe a razão social                                                                                                                                             |
            | 78115012000159 | "da lista" | "da lista" | Revenda Teste | Testando Revenda |           | Sul      | Ativo  | Informe a categoria                                                                                                                                                |
            | 78115012000159 | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Varejo    |          | Ativo  | Informe a regional                                                                                                                                                 |
            | 78115012000159 | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Varejo    | Sul      |        | Informe o status                                                                                                                                                   |


@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_cadastro_CNPJ_invalido.png),[Evidência_2](assets/A_Revenda_cadastro_duplicado.png
    Esquema do Cenário: Cadastro de Revenda - CNPJ inválido ou duplicado
        Dado que o admin esta na tela de "Cadastro de Revendas"
        Quando o admin informar um "<CNPJ>" inválido ou já existente para outra Revenda nesta campanha
        Então o sistema alerta o campo conforme "<Resposta do sistema>"
        Exemplos:
        | CNPJ               | Resposta do sistema |
        | 79.379.491/0090-59 | CNPJ já cadastrado. |
        | 78.115.012/0001-55 | CNPJ inválido.      |



@manual
@Tarefa_#:#59190
@Ajuste_#60426
@Ajuste_#60474
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência_1](assets/A_Revenda_cadastro_sucesso.mp4),[Evidência_2](assets/A_Revenda_cadastro_sucesso_2.mp4)
    Esquema do Cenário: Cadastro de Revenda - Campos válidos e preenchidos
        Dado que o admin esta na tela de "Cadastro de Revendas"
        Quando preencher os campos "<CNPJ>", "<Rede>", "<Grupo>", "<Nome Fantasia>", "<Razão Social>", "<Categoria>", "<Regional>" e "<Status>"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Revenda salva com sucesso"
        E salva a Revenda nesta campanha
        E redireciona o admin de volta para a listagem de "Revendas"
            Exemplos:
            | CNPJ               | Rede       | Grupo      | Nome Fantasia | Razão Social     | Categoria | Regional | CEP       | Endereço        | Número | Complemento | Bairro     | Cidade    | Estado | Status  |
            | 45.333.185/0001-94 | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Varejo    | Sul      | 13471-240 | Avenida América | 544    | testando    | Bela Vista | Americana | SP     | Ativo   |
            | 45.333.185/0001-49 | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Varejo    | Sul      | 13471-240 | Avenida América | 544    | testando    | Bela Vista | Americana | SP     | Inativo |
        #informações são somente de exemplo, utilizar os dados válidos no momento do teste


@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_cadastro_com_campo_op_nao_preenchido.mp4)
    Esquema do Cenário: Cadastro de Revenda - Campos opcionais não preenchidos
        Dado que o admin esta na tela de "Cadastro de Revendas"
        Quando preencher corretamemte os campos "CNPJ", "Rede", "Grupo", "Nome Fantasia", "Razão Social", "Categoria", "Regional" e "Status"
        Mas NÃO preencher os campos opcionais "<CEP>", "<Endereço>", "<Número>", "<Complemento>", "<Bairro>", "<Cidade>" e "<Estado>"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Revenda salva com sucesso"
        E salva a Revenda nesta campanha
        E redireciona o admin de volta para a listagem de "Revendas"
            Exemplos:
            | CNPJ               | Rede       | Grupo      | Nome Fantasia | Razão Social     | Categoria | Regional | CEP | Endereço | Número | Complemento | Bairro | Cidade | Estado | Status  |
            | 47.004.102/0001-49 | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Atavado   | Norte    |     |          |        |             |        |        |        | Ativo   |
            | 47.004.102/0001-49 | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Atavado   | Norte    |     |          |        |             |        |        |        | Inativo |
        #informações são somente de exemplo, utilizar os dados válidos no momento do teste

@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_editar_cancelar.mp4)
    Cenário: Editar Revenda - Acessar e Cancelar
        Dado que o admin esta na tela de "Revendas"
        Quando acionar a opção "Editar" dentro de "Ações" na listagem das Revendas
        Então o sistema redireciona o admin para a tela de "Edição da Revenda" exibindo o ID da respectiva revenda na url
        E todos os dados já cadastrados são exibidos já preenchidos
        Mas o 'CNPJ' é exibido bloqueado para edição
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Revendas"


@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência]()
    Cenário: Editar Revenda - De outra campanha
        Dado que o admin está na tela de "Edição da Revenda" com o ID da respectiva revenda na url
        Quando alterar na url para o ID da "resale" de outra campanha
        E der "Enter"
        Então o sistema redireciona de volta para a tela de "Revendas" impedindo a alteração em outra campanha
    #Neste caso ele não esta direcionando o admin para a tela de listagem e nem altera a revenda da outra campanha, na verdadde ele cria um novo registro na aiw    

@manual
@Tarefa_#:#59190
@Ajuste_#60472
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_cadastro_sucesso_2.mp4)
    Cenário: Editar Revenda - Inserir endereço e Salvar
        Dado que o admin está na tela de "Edição da Revenda"
        E essa revenda não possui endereço definido
        Quando inserir um "CEP" válido, ao dar 'tab' ou mudar de campo
        Então os campos são preenchidos automáticamente "Endereço", "Complemento", "Bairro", "Cidade", "Estado"
        Quando acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas na Revenda da campanha
        E redireciona o admin de volta para a listagem de "Revendas"
        Quando o admin acessar novamente a opção "Editar" desta Revenda
        Então os dados exibidos estarão conforme edições realizadas

@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_editar_add_endereço.mp4)
    Cenário: Editar Revenda - Deletar endereço e Salvar
        Dado que o admin está na tela de "Edição da Revenda"
        E essa revenda já possui endereço definido
        Quando o admin 'deletar' os dados nos campos "CEP", "Endereço", "Complemento", "Bairro", "Cidade", "Estado"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas na Revenda da campanha
        E redireciona o admin de volta para a listagem de "Revendas"
        Quando o admin acessar novamente a opção "Editar" desta Revenda
        Então os dados exibidos estarão conforme edições realizadas, sem o endereço

  
@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_editar_endereço.mp4)
    Cenário: Editar Revenda - Alterar endereço e Salvar
        Dado que o admin está na tela de "Edição da Revenda"
        E essa revenda já possui endereço definido
        Quando o admin 'alterar' os dados nos campos "CEP", "Endereço", "Complemento", "Bairro", "Cidade", "Estado"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas na Revenda da campanha
        E redireciona o admin de volta para a listagem de "Revendas"
        Quando o admin acessar novamente a opção "Editar" desta Revenda
        Então os dados exibidos estarão conforme edições realizadas, com novo endereço

@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_editar_campos_obrigatorios.mp4)
    Cenário: Editar Revenda - Alterar campos obrigatórios e salvar
        Dado que o admin está na tela de "Edição da Revenda"
        E o "CNPJ" é bloqueado para edição
        Quando o admin alterar os campos "Rede", "Grupo", "Nome Fantasia", "Razão Social", "Categoria", "Regional" e "Status"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas na Revenda da campanha
        E redireciona o admin de volta para a listagem de "Revendas"
        Quando o admin acessar novamente a opção "Editar" desta Revenda
        Então os dados exibidos estarão conforme edições realizadas


@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_editar_campos_obrigatorios_vazios.mp4)
    Esquema do Cenário: Editar Revenda - Campos obrigatórios não preenchidos
        Dado que o admin esta na tela de "Edição da Revenda"
        Quando NÃO preencher (remover) os campos "<Rede>", "<Grupo>", "<Nome Fantasia>", "<Razão Social>", "<Categoria>", "<Regional>" e "<Status>"
        E acionar o botão "Salvar"
        Então o sistema alerta a obrigatoriedade de cada campo conforme "<Resposta do sistema>"
        Exemplos:
            | Rede       | Grupo      | Nome Fantasia | Razão Social     | Categoria | Regional | Status  | Resposta do sistema                                                                                                                                                |
            |            |            |               |                  |           |          |         | Informe o CNPJ ; Informe a rede ; Informe o grupo ; Informe o nome fantasia ; Informe a razão social ; Informe a categoria ; Informe a regional ; Informe o status |
            | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Atacado   | Sul      | Ativo   | Informe o CNPJ                                                                                                                                                     |
            |            | "da lista" | Revenda Teste | Testando Revenda | Varejo    | Sul      | Inativo | Informe a rede                                                                                                                                                     |
            | "da lista" |            | Revenda Teste | Testando Revenda | Atacado   | Sul      | Ativo   | Informe o grupo                                                                                                                                                    |
            | "da lista" | "da lista" |               | Testando Revenda | Varejo    | Sul      | Inativo | Informe o nome fantasia                                                                                                                                            |
            | "da lista" | "da lista" | Revenda Teste |                  | Atacado   | Sul      | Ativo   | Informe a razão social                                                                                                                                             |
            | "da lista" | "da lista" | Revenda Teste | Testando Revenda |           | Sul      | Inativo | Informe a categoria                                                                                                                                                |
            | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Varejo    |          | Ativo   | Informe a regional                                                                                                                                                 |
            | "da lista" | "da lista" | Revenda Teste | Testando Revenda | Atacado   | Sul      |         | Informe o status                                                                                                                                                   |


@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_log.png)
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


#13 CN