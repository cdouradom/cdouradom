#language: pt

Funcionalidade: Admin - Relatório de Vendas
Como usuário administrador ativo na Plataforma
Quero acessar o relatório de vendas
Para visualizar e exportar os registros das importações realizadas na campanha

BD 
    SELECT * FROM `aiwa_sell_out` ORDER BY id DESC;

-----

 Critérios de Aceitação:
Exibir breadcrumb
Exibir os seguintes filtros: "Categoria", "Produto", "Grupo", "Rede", "Revenda", "Data de", "Data até", "Nota fiscal" e botão "Buscar"
No filtro "Categoria" - Lista suspensa com as categorias da campanha
No filtro "Produto" - funcionar com autocomplete e concatenando SKU + EAN + Descrição do produto
No filtro 'Grupo' - Lista suspensa com os grupos da campanha
No filtro 'Rede' - Lista suspensa com as redes da campanha
No filtro 'Revenda' - Lista suspensa com as revendas da campanha, concatenando o CNPJ e Nome da Revenda
Nos filtros 'Grupo', 'Rede' e 'Revenda' - funcionar com autocomplete para buscar na lista suspensa
Ao filtrar por um 'Grupo' e/ou 'Rede', limitar as opções na listagem de 'Grupo', 'Rede' e 'Revenda' conforme vínculo do primeiro filtro #confirmar
Nos filtros 'Data de' e 'Data até' - exibir calendário para selecionar datas
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro ou quando não existem resultados para a busca realizada: "Nenhum registro encontrado."
Exibir o seguinte cabeçalho: "Data da venda", "Produto", "Venda", "Revenda", "Vendedor", "Gerente Direto", "Supervisor" e "Gerente Regional"
Na coluna "Data da venda" exibir DD/MM/AAAA conforme importação
Na coluna "Produto" concatenar as informações se SKU + EAN + descrição do produto
Na coluna "Venda" exibir PedidoNF + número da NF + Quantidade conforme venda
Na coluna "Revenda" concatenar o CNPJ e nome da revenda #confirmar se é o nome fantasia
Na coluna "Vendedor" concatenar o CPF e o nome do usuário conforme importação
Na coluna "Gerente Direto" concatenar o CPF e o nome do usuário conforme importação
Na coluna "Supervisor" concatenar o CPF e o nome do usuário conforme importação
Na coluna "Gerente Regional" concatenar o CPF e o nome do usuário conforme importação
As colunas "Gerente Direto (CPF + Nome)", "Supervisor (CPF + Nome)" e "Gerente Regional (CPF + Nome)" podem ser vazias de acordo com Vendas sem essas colunas preenchidas #confirmando/atualizar linha
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do relatório de Vendas, "apenas quando existem registros listados"
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de vendas" na extensão ".xlsx"
Exibir apenas as vendas de arquivo aprovados

---

@manual
@Tarefa_#63797
@ajuste_#65498
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/A-vendas-acessar-e-layout.mp4
    Cenário: Vendas - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Relatórios"
        E o admin clicar no submenu "Relatório de Vendas"
        Então o sistema redireciona para a tela da listagem do "Relatório de Vendas"
        E os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                                                                    |
            | Filtros     | "Categoria", "Produto", "Grupo", "Rede", "Revenda", "Data de", "Data até", "Nota fiscal"                        |
            | Botão       | "Buscar" à frente ou abaixo dos filtros                                                                         |
            | Resultados  | Texto informativo e dinâmico: "Foram encontrados xx registros"                                                  |
            | Listagem    | "Data da venda", "Produto", "Venda", "Revenda", "Vendedor", "Gerente Direto", "Supervisor" e "Gerente Regional" |
            | Botão       | "Exportar Registros" na parte inferior direita da tela, "apenas quando existem registros listados"              |
#65498 - O caminho descrito no breadcrumbs está incorreto. ...... O cabeçalho da coluna destinada ao "Supervisor" está com a descrição "Lider de Loja"
#65498- Ajustar a nomenclatura do botão "Exportar Registros" (está "Exportar Produtos")

@manual
@Tarefa_#63797
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Vendas - Paginação e transição
        Dado que o admin acessou a tela de "Vendas"
        Quando não existem registros na campanha
        Então manter listagem vazia com texto padrão "Nenhum registro encontrado."
        E não exibe o botão "Exportar Registros"
        Quando existem registros na campanha
        E a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        E a ordenação dá-se pelo data de venda em ordem decrescente
        Quando o admin transitar para as próximas páginas ou para as páginas anteriores
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cada respectiva página sem apresentar erros
       


@manual
@Tarefa_#63797
@ajuste_#65504
@ajuste_#65506
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/A-vendas-filtrar.png,assets/A-vendas-filtrar-II.png,assets/A-vendas-filtrar-III.png,assets/A-vendas-filtrar-IV.png,assets/A-vendas-filtrar-V.png,assets/A-vendas-filtrar-VI.png,assets/A-vendas-filtrar-VII.png,assets/A-vendas-filtrar-VIII.png,assets/A-vendas-filtrar-IX.png,assets/A-vendas-filtrar-X.png,assets/A-vendas-filtrar-Grupo-corrigido.png,assets/A-vendas-filtrar-Somente-Data-Inicial-corrigido.png,assets/A-vendas-filtrar-Somente-Data-Final-corrigido.png,assets/A-vendas-filtrar-Data-Inicial-e-Data-Final-corrigido.png,assets/A-vendas-filtrar-Data-Inicial-Maior-que-a-Data-Final-corrigido.png
    Cenário: Vendas - Filtrar
        Dado que o admin acessou a tela de "Vendas"
        Quando o admin utilizar o filtro "Produto"
        E digitar o SKU, ou o EAN ou a descrição do produto
        Então o sistema funcionará como 'like' ou autocomplete listando somente as opções respectivas ao termo digitado
        Quando o admin utilizar os filtros "Grupo" e "Rede" 
        Então no filtro grupo o sistema funcionará localizando as opções da letra digitada
        E no filtro "Rede" o sistema funcionará como 'like' ou autocomplete listando somente as opções respectivas ao termo digitado
        Quando o admin utilizar o filtro "Revenda"
        E digitar o CNPJ ou o nome fantasia da revenda
        Então o sistema funcionará como 'like' ou autocomplete listando somente as opções respectivas ao termo digitado
        Quando o admin realizar buscas nos campos "<Categoria>", "<Produto>", "<Grupo>", "<Rede>", "<Revenda>", "<Data inicial>", "<Data final>" e "<Nota Fiscal>"
        E acionar o botão "Buscar"
        Então o sistema realiza a busca nos registros da campanha 
        E atualiza o valor no texto informativo "Foram encontrados xxx registros"
        E retorna conforme "<Resposta do sistema>" das vendas aprovadas
        E existentes na tabela aiwa_sell_out
        Mas se "Buscar" por parâmetros que não possuem registros na campanha
        Então o sistema retorna "Nenhum registro encontrado.", pois não existem registros correspondentes na campanha para a busca realizada
        E não exibe o botão "Exportar Registros" no final da página
            Exemplos:
            | <Categoria> | <Produto>   | <Grupo>    | <Rede>     | <Revenda>  | <Data inicial> | <Data final> | <Nota Fiscal> | <Resposta do sistema>                                                                       |
            | 'da lista'  | 'existente' | 'da lista' | 'da lista' | 'da lista' | 'com venda'    | 'com venda'  | 'existente'   | Lista somente a venda correspondente aos filtros aplicados em conjunto                      |
            | 'da lista'  | vazio       | vazio      | vazio      | vazio      | vazio          | vazio        | vazio         | Lista somente a(s) venda(s) dos produtos na Categoria correspondente à busca                |
            | vazio       | 'existente' | vazio      | vazio      | vazio      | vazio          | vazio        | vazio         | Lista somente a(s) venda(s) do produto correspondente à busca                               |
            | vazio       | vazio       | 'da lista' | vazio      | vazio      | vazio          | vazio        | vazio         | Lista todos as vendas dos usuários vinculados ao Grupo buscado (vínculo através da Revenda) |
            | vazio       | vazio       | vazio      | 'da lista' | vazio      | vazio          | vazio        | vazio         | Lista todos as vendas dos usuários vinculados a Rede buscada (vínculo através da Revenda)   |
            | vazio       | vazio       | vazio      | vazio      | 'da lista' | vazio          | vazio        | vazio         | Lista todos as Vendas dos usuários vinculados a Revenda buscada                             |
            | vazio       | vazio       | vazio      | vazio      | vazio      | 'com venda'    | 'com venda'  | vazio         | Lista somente a(s) venda(s) do período correspondente à busca                               |
            | vazio       | vazio       | vazio      | vazio      | vazio      | 'hoje'         | 'hoje'       | vazio         | Lista somente a(s) venda(s) do período correspondente à busca                               |
            | vazio       | vazio       | vazio      | vazio      | vazio      | 'ontem'        | 'hoje'       | vazio         | Lista somente a(s) venda(s) do período correspondente à busca                               |
            | vazio       | vazio       | vazio      | vazio      | vazio      | 'hoje'         | vazio        | vazio         | Lista somente a(s) venda(s) a partir da data inicial informada                              |
            | vazio       | vazio       | vazio      | vazio      | vazio      | 'ontem'        | vazio        | vazio         | Lista somente a(s) venda(s) a partir da data inicial informada                              |
            | vazio       | vazio       | vazio      | vazio      | vazio      | vazio          | 'hoje'       | vazio         | Lista somente a(s) venda(s) até a data final informada                                      |
            | vazio       | vazio       | vazio      | vazio      | vazio      | vazio          | 'ontem'      | vazio         | Lista somente a(s) venda(s) até a data final informada                                      |
            | vazio       | vazio       | vazio      | vazio      | vazio      | 'com venda'    | 'com venda'  | vazio         | Lista somente a(s) venda(s) até a data final informada                                      |
            | vazio       | vazio       | vazio      | vazio      | vazio      | 'com venda'    | vazio        | vazio         | Lista somente a(s) venda(s) a partir da data inicial informada                              |
            | vazio       | vazio       | vazio      | vazio      | vazio      | vazio          | 'com venda'  | vazio         | Lista somente a(s) venda(s) até a data final informada                                      |
            | vazio       | vazio       | vazio      | vazio      | vazio      | vazio          | vazio        | 'existente'   | Lista somente a(s) venda(s) até a data final informada                                      |
            | vazio       | vazio       | vazio      | vazio      | vazio      | '10/11/2022'   | '09/11/2022' | vazio         | Exibe alerta de que Data final deve ser menor que Data inicial                              |
        #cenário na linha 1 da tabela, realizar conforme dados possível, apenas sendo um conjunto de filtros, ou seja, não precisa ser igual esta descrito com todos os filtros. Preenchi tudo apenas para reaproveitar a linha nas posteriores.
#65504 - O filtro por "Grupo" não está retornando nenhum resultado
#65504 - Quando aplicamos o filtro com apenas a data incial, o sistema retorna todos os resultados, independentemente de data
#65504 - Quando aplicamos o filtro com apenas a data final, o sistema retorna uma tela em branco.
#65506 - Sugestão - Exibir alerta de data final maior que a data inicial


@manual
@Tarefa_#63797
@ajuste_#65508
@manual-result:success
@manual-last-tested:30-11-2022
@manual-test-evidence:Relatorio-de-vendas.xlsx
    Cenário: Vendas - Exportar Registros
        Dado que o admin acessou a tela de "Vendas"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Vendas" em extensão .xlsx
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin não realizar buscas
        E acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Vendas" em extensão .xlsx
        E todos os registros de vendas aprovadas na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
#65508 - A formatação do campo EAN está incorreta
#65508 - A nomenclatura da coluna "CPF Supervisor" está incorreta

@manual
@Tarefa_#63797
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/A-vendas-inserir-novas-linhas-com-importacao-de-arquivo-de-vendas.mp4
    Cenário: Vendas - Inserir novas linhas com importação de arquivo de Vendas
        Dado que o admin importou um novo arquivo de vendas
        Quando aprovar este arquivo nas telas do sell out
        E acessar novamente o relatório de vendas
        Então as novas vendas serão exibidas na listagem de vendas
        E no arquivo "Relatório de Vendas.xlsx" conforme o modelo requerido em escopo


#5 CN
