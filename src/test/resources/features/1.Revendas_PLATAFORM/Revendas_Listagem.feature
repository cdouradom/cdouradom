#language: pt

Funcionalidade: Admin - Listagem de Revendas
Como usuário administrador ativo na Plataforma
Quero visualizar aa Revendas da campanha
Para realizar buscas, ações e exportar os registros

-----

Critérios de Aceitação:
Exibir breadcrumb
Exibir os seguintes filtros: "CNPJ", "Nome da Revenda", "Grupo", "Rede", "Regional", "Categoria", "Status" e botão "Buscar"
Exibir no parte superior direita da tela o botão "Cadastrar" 
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado par a busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "CNPJ", "Nome revenda (fantasia)", "Regional", "Categoria" e "Status" e botão "Editar"  #Exibir dentro de "Ações" os seguintes submenus: "Editar"; "Limites de Comissionamento"; "Comissões Gerentes e Líderes"; "Histórico de Gerentes e Líderes" e "Códigos de Produtos"
No select "Regional" listas as opções abaixo #confirmar lista correta de regionais, tem duas listas no escopo
    - Norte 
    - Nordeste 
    - Centro-Oeste 
    - Sul 
    - Sudeste 
    - São Paulo Capital 
    - São Paulo Interior 
Exibir na listagem os dados conforme cabeçalho, CNPJ com máscara e o nome é o nome fantasia cadastrado
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do relatório de Revendas, apenas quando existem registros listados
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de revendas" na extensão ".xlsx"

---

@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_layout.png)
    Cenário: Revendas - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu principal "Gerencial"
        E acionar o menu "Revendas"
        Então o sistema redireciona para a tela da listagem de "Revendas"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente


@manual
@Tarefa_#:#59190
@manual-result:success
@AJuste_#60475
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_Filtro.mp4)
    Esquema do Cenário: Revendas - Realizar buscar com dados válidos/existentes
        Dado que o admin esta na listagem de "Revendas"
        Quando preencher todos, alguns ou um dos filtros "<CNPJ>", "<Nome>", "<Grupo>", "<Rede>", "<Regional>", "<Categoria>" e "<Status>" com valores existentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar o valor no texto informativo " Foram encontrados ** registros"
        E exibirá na listagem somente o(s) registro(s) respectivo(s) à busca conforme "<Resultado do sistema>"
            Exemplos:
            | "CNPJ"             | "Nome"   | "Grupo"     | "Rede"     | "Regional"   | "Categoria" | "Status" | Resultado do Sistema                                                               |
            | 79.379.491/0090-59 | Testando | Teste       | Teste      | Sudeste      |             | Ativo    | Lista apenas a Revenda respectiva à busca, pois não podem ter CNPJs em duplicidade |
            |                    | Testando | Teste       | Teste      | Sudeste      |             | Ativo    | Lista a(s) Revenda que possui(em) este nome e respectiva(s) à busca                |
            | 79.379.491/0090-59 |          | Teste       | Teste      | Sudeste      |             | Ativo    | Lista apenas a Revenda respectiva à busca, pois não podem ter CNPJs em duplicidade |
            | 79.379.491/0090-59 | Testando |             | Teste      | Sudeste      |             | Ativo    | Lista apenas a Revenda respectiva à busca, pois não podem ter CNPJs em duplicidade |
            | 79.379.491/0090-59 | Testando | Teste       |            | Sudeste      |             | Ativo    | Lista apenas a Revenda respectiva à busca, pois não podem ter CNPJs em duplicidade |
            | 79.379.491/0090-59 | Testando | Teste       | Teste      |              |             | Ativo    | Lista apenas a Revenda respectiva à busca, pois não podem ter CNPJs em duplicidade |
            | 79.379.491/0090-59 | Testando | Teste       | Teste      | Sudeste      |             |          | Lista apenas a Revenda respectiva à busca, pois não podem ter CNPJs em duplicidade |
            | 79.379.491/0090-59 |          |             |            |              |             |          | Lista apenas a Revenda respectiva à busca, pois não podem ter CNPJs em duplicidade |
            |                    | Testado  |             |            |              |             |          | Lista a(s) Revenda que possui(em) este nome                                        |
            |                    |          | Grupo Teste |            |              |             |          | Lista somente as Revendas vinculadas ao Grupo                                      |
            |                    |          |             | Rede Teste |              |             |          | Lista somente as Revendas vinculadas a Rede                                        |
            |                    |          |             |            | Nordeste     |             |          | Lista somente as Revendas da Regional Nordeste                                     |
            |                    |          |             |            |              | Atacado     |          | Lista somente as Revendas da Categoria Atacado                                     |
            |                    |          |             |            |              |             | Ativo    | Lista somente as Revendas com Status Ativo                                         |
            |                    |          |             |            |              |             | Inativo  | Lista somente as Revendas com Status Inativo                                       |
            |                    |          | Grupo Teste |            |              |             | Inativo  | Lista somente as Revendas com Status Inativo vinculadas ao Grupo                   |
            |                    |          |             | Rede Teste |              |             | Ativo    | Lista somente as Revendas com Status Ativo vinculadas a Rede                       |
            |                    |          |             |            | Suldeste     |             | Ativo    | Lista somente as Revendas com Status Ativo da Regional Suldeste                    |
            |                    |          | Grupo Teste | Rede Teste |              |             |          | Lista somente as Revendas vinculadas ao Grupo Teste e Rede Teste                   |
            |                    |          | Grupo Teste |            | Centro-Oeste |             |          | Lista somente as Revendas vinculadas ao Grupo Teste e da Regional Centro-Oeste     |
            |                    |          |             | Rede Teste | Centro-Oeste |             |          | Lista somente as Revendas vinculadas a Rede Teste e da Regional Centro-Oeste       |



@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_Filtro.mp4)
    Cenário: Revendas - Realizar buscas com dados inexistente/inválidos
        Dado que o admin esta na listagem de "Revendas"
        Quando preencher todos, alguns ou um dos filtros com valores inexistentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar o valor no texto informativo "Nenhum registro encontrado."
        E a listagem ficará vazia
        E o botão "Exportar Registros" não será disponibilizado


@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_Revenda_exportar_com_filtro.mp4),[Evidência_2](assets/A_Revenda_exportar_sem_filtro.mp4)
    Cenário: Revendas - Exportar Registros
        Dado que o admin esta na listagem de "Revendas"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Revendas" em extensão ".xlsx"
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin não realizar buscas
        E acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Revendas" em extensão ".xlsx"
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando realizar uma busca com "Nenhum registro encontrado."
        Então o botão "Exportar Registros" não será exibido na tela
    

@manual
@Tarefa_#:#59190
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência]
    Cenário: Revendas - Paginação e transição
        Dado que o admin esta na listagem de "Revendas"
        E existem Revendas gerando paginação
        Quando o admin transitar para as próximas páginas ou para as páginas anteriores
        Então o sistema irá redirecionar para as outras páginas sem erros

#5 CN