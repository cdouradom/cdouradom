#language: pt

Funcionalidade: Listagem de Produtos
Como usuário administrador ativo na Plataforma
Quero visualizar os Produtos da campanha
Para realizar buscas, ações e exportar os registros

    BD 
        account_campaign_product
-----

Critérios de Aceitação:
Acessado através do menu - Gerencial > Tabela de Pontuação > Produtos
Exibir breadcrumb na tela
Exibir no parte superior direita da tela o botão "Novo Produto"
Exibir os seguintes filtros: "SKU", "EAN", "Categoria", "Subcategoria", "Produto", "Status" e botão "Buscar"
O filtro 'Categoria' : é uma lista suspensa com as "categorias cadastradas"
O filtro 'Subcategoria' : é uma lista suspensa com as "subcategorias cadastradas"
O filtro 'Status': é um select com as opções "Ativo" e "Inativo"
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultados para uma busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "SKU", "EAN", "Categoria", "Subcategoria", "Produto", "Status" e botão "Ações" 
Exibir a listagem conforme cabeçalho
Exibir dentro de "Ações" o submenu: "Editar"
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do relatório de Produtos, apenas quando existem registros listados
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Tabela de Produtos.xlsx"

---

@manual
@tarefa_#:61000
@manual-result:success
@manual-last-tested:17-10-2022
@manual-test-evidence:assets/A-produtos-acessar-e-layout.mp4
    Cenário: Produtos - Acessar e Layout
        Dado que o admin está logado na Plataforma
        Quando acionar o menu "Gerencial"
        E o menu "Tabela de Pontuação"
        E o submenu "Produtos"
        Então o sistema redireciona para a tela da listagem de "Produtos"
        Quando ainda não existem Produtos cadastrados
        Então a listagem fica vazia com a mensagem "Nenhum registro encontrado"
        E não exibe o botão "Exportar Registros"
        Mas quando já existem "Produtos" cadastradas nesta campanha
        Então serão exibidos na listagem com botão "Editar" em "Ações"
        Quando o usuário visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente


@manual
@tarefa_#:61000
@manual-result:success
@manual-last-tested:17-10-2022
@manual-test-evidence:assets/A-produtos-filtrar-I.mp4,assets/A-produtos-filtrar-II
    Esquema do Cenário: Produtos - Filtrar
        Dado que já existem registros de Produtos cadastrados
        Quando o admin realizar buscas por "<SKU>", "<EAN>", "<Categoria>", "<Subcategoria>", "<Produto>", "<Status>"
        E acionar o botão "Buscar"
        Então o sistema realiza a busca nos Produtos da campanha 
        E atualiza o valor no texto informativo " Foram encontrados xxx registros"
        E retorna conforme "<Resultado do sistema>"
            Exemplos:
            | <SKU>         | <EAN>           | <Categoria> | <Subcategoria> | <Produto>              | <Status> | <Resultado do sistema>                                                                                     |
            | 'Pto123'      |                 |             |                |                        |          | Lista somente o produto do respectivo SKU, e disponibiliza o botão "Exportar Registros"                    |
            |               | '1112223334567' |             |                |                        |          | Lista somente o produto do respectivo EAN, e disponibiliza o botão "Exportar Registros"                    |
            |               |                 | 'Fogão'     |                |                        |          | Lista somente os produtos da categoria Fogão e disponibiliza o botão "Exportar Registros"                  |
            |               |                 |             | 'Cooktop'      |                        |          | Lista somente os produtos da subcategoria COOKTOP e disponibiliza o botão "Exportar Registros"             |
            |               |                 |             |                | 'Produto Teste Pto123' |          | Lista somente o(s) produto(s) respectivo(s) ao nome buscado e disponibiliza o botão "Exportar Registros"   |
            |               |                 |             |                | 'Teste'                |          | Lista todos osprodutos que contém o termo buscado e disponibiliza o botão "Exportar Registros"             |
            |               |                 |             |                |                        | Ativo    | Lista somente os produtos Ativos cadastrados nesta campanha e disponibiliza o botão "Exportar Registros"   |
            |               |                 |             |                |                        | Inativo  | Lista somente os produtos Inativos cadastrados nesta campanha e disponibiliza o botão "Exportar Registros" |
            | 'inexistente' |                 |             |                |                        |          | Nenhum registro encontrado, e não exibe o botão "Exportar Registros"                                       |
            |               | 'inexistente'   |             |                |                        |          | Nenhum registro encontrado, e não exibe o botão "Exportar Registros"                                       |
            |               |                 |             |                | 'inexistente'          |          | Nenhum registro encontrado, e não exibe o botão "Exportar Registros"                                       |



@manual
@tarefa_#:61000
@manual-result:success
@manual-last-tested:17-10-2022
@manual-test-evidence:assets/A-produtos-exportar-registros.mp4,assets/A-produtos-exportar-registros-II,assets/Tabela-de-produtos.xlsx
Cenário: Produtos - Exportar Registros
    Dado que o admin está na listagem de "Produtos"
    E que já existem registros cadastrados/listados
    Quando acionar o botão "Exportar Registros"
    Então o sistema irá fazer o download do arquivo "Tabela de Produtos" em extensão ".xlsx"
    E todos os Produtos existentes na campanha deverão compor o arquivo que deve ser conforme modelo requerido em escopo
    Mas se aplicada uma busca onde o sistema filtre os resultados, limitando os registros na listagem
    Quando acionar o botão "Exportar Registros"
    Então somente os resultados encontrados conforme busca deverão compor o arquivo "Tabela de Produtos.xlsx"
    

@manual
@tarefa_#:61000
@manual-result:success
@manual-last-tested:17-10-2022
@manual-test-evidence:assets/A-produtos-paginacao-e-transicao.mp4
Cenário: Produtos - Paginação e transição
    Dado que o admin está na listagem de "Produtos"
    E a quantidade de registros ultrapassar 20 linhas
    Então deve-se gerar paginação
    Quando o admin transitar para as próximas páginas ou para as páginas anteriores
    Então o sistema irá redirecionar para as outras páginas exibindo os dados de cada respectiva página sem apresentar erros


#4CN