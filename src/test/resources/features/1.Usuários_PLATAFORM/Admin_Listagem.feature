#language: pt

Funcionalidade: Admin - Listagem de Usuários
Como usuário administrador ativo na Plataforma
Quero visualizar os usuários existentes
Para realizar buscas, ações e exportar os registros

-----

Critérios de Aceitação:
Exibir breadcrumb
Exibir os seguintes filtros: "ID", "CPF", "Nome", "CNPJ da Revenda", "Cargo", "Status" e botão "Buscar"
Lsitar no select "CNPJ da Revenda" todas as revendas desta campanha
Lsitar no select "Cargo": 'Vendedor', 'Gerente', 'Subgerente', 'Supervisor' e 'Gerente Regional'
Lsitar no select "Status: 'Ativo" e 'Inativo', 'Suspenso Temporariamente' e 'Cadastro Pendente'
Exibir no parte superior direita da tela o botão "Cadastrar" 
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultados para a busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "ID", "CPF", "Nome", "Cargo", "Status", "Saldo" e botão "Ações"
Exibir na listagem os dados conforme cabeçalho, CPF com máscara
Exibir dentro de "Ações" as opções "Alterar", "Extrato" e "Pedidos"
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do relatório de Usuários, apenas quando existem registros listados
Não Disponibilizar "Exportar Registros" para download do relatório de usuários quando uma busca não gerar resultados.
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Usuários" na extensão ".xlsx"


---

@manual
@Tarefa_#:#59191
@manual-result:success
@manual-last-tested:
@manual-test-evidence:[Evidência](assets/A_User_layout.png)
    Cenário: Usuários - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu principal "Gerencial"
        E acionar o menu "Usuários"
        Então o sistema rediciona para a tela da listagem de "Usuários"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente


@manual
@Tarefa_#:#59191
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_User_filtro.mp4)
Esquema do Cenário: Usuários - Busca com dados válidos/existentes
        Dado que o admin esta na listagem de "Usuários"
        Quando preencher todos, alguns ou um dos filtros "<ID>", "<CPF>", "<Nome>", "<CNPJ da Revenda>", "<Cargo>" e "<Status>" com valores existentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar o valor no texto informativo " Foram encontrados ** registros"
        E exibirá na listagem somente o(s) registro(s) respectivo(s) à busca conforme "<Resultado do sistema>"
        Exemplos:
            | <ID>   | <CPF>          | <Nome> | <CNPJ da Revenda> | <Cargo>  | "Status" | Resultado do Sistema                                                        |
            | 698033 |                |        |                   |          |          | Lista apenas o usuário respectiva à busca, pois só existe um usuário por ID |
            |        | 348.108.998-88 |        |                   |          |          | Lista apenas o usuário respectiva à busca, pois o CPF é unico               |
            |        |                | Teste  |                   |          |          | Lista apenas o(s) usuário(s) que contenham esse termo no nome               |
            |        |                |        | Cintia Teste      |          |          | Lista apenas o(s) usuário(s) com vínculo à respectiva Revenda               |
            |        |                |        |                   | Vendedor |          | Lista apenas o(s) usuário(s) deste cargo                                    |
            |        |                |        | Cintia Teste      | Vendedor |          | Lista apenas o(s) usuário(s) com vínculo à respectiva Revenda deste cargo   |
            |        |                |        |                   |          | Ativo    | Lista apenas o(s) usuário(s) Ativo(s)                                       |
            |        |                |        |                   |          | Inativo  | Lista apenas o(s) usuário(s) Inativo(s)                                     |
    #informações são somente de exemplo, considerar e utilizar os dados existentes no momento do teste

@manual
@Tarefa_#:#59191
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_User_filtro_invalido.mp4)
    Cenário: Usuários - Busca com dados inexistente/inválidos
        Dado que o admin esta na listagem de "Usuários"
        Quando preencher todos, alguns ou um dos filtros com valores existentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar a listagem com a mensagem "Nenhum registro encontrado." 
        Quando a busca resultar em "Nenhum registro encontrado."
        Então o botão "Exportar Registros" não será exibido na tela


@manual
@Tarefa_#:#59191
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_User_exportar_filtrado.mp4)
    Cenário: Usuários - Exportar Registros
        Dado que o admin esta na listagem de "Usuários"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Usuários" em extensão ".xlsx"
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo
        E deve ser conforme o modelo requerido em escopo
        Quando o admin não realizar buscas
        E acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Usuários" em extensão ".xlsx"
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo        



@manual
@Tarefa_#:#59191
@manual-result:success
@manual-last-tested:30-09-2022
@manual-test-evidence:[Evidência](assets/A_User_exportar_sem_filtro.mp4)
Cenário: Usuários - Ações e submenus
    Dado que o admin esta na listagem de "Usuários"
    Quando acionar a opção "Ações" em algum usuário exibido na listagem
    Então o sistema exibirá apenas as opções "Alterar", "Extrato" e "Pedidos"
    Quando o admin cliar em "Alterar"
    Então o sistema redireciona para tela de edição deste usuário
    Quando o admin cliar em "Extrato"  
    Então o sistema redireciona para o relatório de "Pontos Distribuídos" filtrando por esse usuário no 'CPF' 
    Quando o admin cliar em "Pedidos"  
    Então o sistema redireciona para o relatório de "Pedidos" filtrando por esse usuário no 'CPF'


@manual
@Tarefa_#:#59191
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_User_paginação.mp4)
Cenário: Usuários - Paginação e transição
    Dado que o admin esta na listagem de "Usuários"
    Quando a quantidade de registros ultrapassar 20 linhas
    Então deve-se gerar paginação
    Quando o admin acionar a transição de páginas
    Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros

#6 CN