#language: pt

Funcionalidade: Listagem de Categorias
Como usuário administrador ativo na Plataforma
Quero visualizar as Categorias da campanha
Para realizar buscas, ações e exportar os registros

BD
SELECT * FROM account_campaign_department WHERE account_id = ;
OBS: parent_id é o relacionamento da sub com a categoria
-----

Critérios de Aceitação:
Acessado através do menu - Gerencial > Tabela de Pontuação > Subcategorias
Exibir breadcrumb
Exibir os seguintes filtros: "ID Subcategoria", "Categoria", "Subcategoria" e botão "Buscar" 
Exibir no parte superior direita da tela o botão "Cadastrar" 
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado para uma busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "ID", " Categoria", "Subcategoria" e botão "Ações/Editar"
Exibir na listagem os dados conforme cabeçalho, ID do banco conforme registro e o nome da Subcategoria cadastrada
Exibir dentro de "Ações" o submenu: "Editar"
Fazer paginação com 20 registros por página
Disponibilizar na parte inferior direita da tela o botão "Exportar Registros" para download do relatório de Subcategoria, apenas quando existem registros listados
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Subcategoria de produtos" na extensão ".xlsx"

--

@manual
@tarefa_#60992
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_subcategoria-acessar-e-layout.mp4)
    Cenário: Subcategoria - Acessar e Layout
        Dado que o admin está logado na Plataforma
        Quando acionar o menu "Gerencial"
        E o menu "Tabela de Pontuação"
        E o submenu "Subcategoria"
        Então o sistema redireciona para a tela da listagem de "Subcategoria"
        Quando ainda não existem Subcategoria cadastradas
        Então a listagem fica vazia com a mensagem "Nenhum registro encontrado"
        E não exibe o botão "Exportar Registros"
        Mas quando já existem "Subcategoria" cadastradas nesta campanha
        Então serão exibidas na listagem com botão "Editar" em "Ações"
        Quando o usuário visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente



@manual
@tarefa_#60992
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_subcategoria-filtrar.mp4)
    Esquema do Cenário: Subcategoria - Filtrar
        Dado que já existem registros de Subcategoria cadastradas
        Quando o admin realizar buscas nos filtros "<ID Subcategoria>", "<Subcategoria>" e/ou "<Categoria>"
        E acionar o botão "Buscar"
        Então o sistema realiza a busca nos registros da campanha 
        E atualiza o valor no texto informativo " Foram encontrados xxx registros"
        E retorna na listagem conforme "<Resultado do sistema>"
            Exemplos:
            | <ID Subcategoria>               | <Subcategoria>                          | <Categoria>                             | <Resultado do sistema>                                                                   |
            | "id existente nesta campanha"   |                                         |                                         | Lista somente a categoria respectiva ao ID buscado e o botão "Expotar Registros"         |
            | "id inexistente nesta campanha" |                                         |                                         | Nenhum registro encontrado, e não exibe o botão "Expotar Registros"                      |
            |                                 | "existente nesta campanha"              |                                         | Lista somente a subcategoria respectiva e o botão "Expotar Registros"                    |
            |                                 | "existente nesta campanha. Ex.: teste"  |                                         | Lista todas as subcategoria que possuam este termo buscado e o botão "Expotar Registros" |
            |                                 | "inexistente nesta campanha. Ex.: XPTO" |                                         | Nenhum registro encontrado, e não exibe o botão "Expotar Registros"                      |
            |                                 |                                         | "existente nesta campanha"              | Lista somente a categoria respectiva                                                     |
            |                                 |                                         | "existente nesta campanha. Ex.: teste"  | Lista todas as categorias que possuam este termo buscado                                 |
            |                                 |                                         | "inexistente nesta campanha. Ex.: XPTO" | Nenhum registro encontrado, e não exibe o botão "Expotar Registros"                      |


@manual
@tarefa_#60992
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_subcategorias-exportar-registros.mp4)
Cenário: Subcategorias - Exportar Registros
    Dado que o admin está na listagem de "Subcategorias"
    E que já existem registros de Subcategoria cadastradas/listadas
    Quando acionar o botão "Exportar Registros"
    Então o sistema irá fazer o download do arquivo "Relatório de Subcategoria de produtos" na extensão ".xlsx"
    E todos os registros existentes na campanha deverão compor o arquivo
    E deve ser conforme o modelo requerido em escopo
    Mas se aplicada uma busca onde o sistema filtre os resultados, limitando os registros
    Quando acionar o botão "Exportar Registros"
    Então somente os resultados encontrados conforme busca deverão compor o arquivo "Relatório de Subcategoria de produtos.xlsx"
    


@manual
@tarefa_#60992
@Sugestão_#61283
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_subategorias-paginação-e-transição-v2.mp4)
Cenário: Subategorias - Paginação e transição
    Dado que o admin está na listagem de "Categorias"
    E a quantidade de registros ultrapassar 20 linhas
    Então deve-se gerar paginação
    Quando o admin transitar para as próximas páginas ou para as páginas anteriores
    Então o sistema irá redirecionar para as outras páginas exibindo os dados de cada respectiva página sem apresentar erros


#4CN