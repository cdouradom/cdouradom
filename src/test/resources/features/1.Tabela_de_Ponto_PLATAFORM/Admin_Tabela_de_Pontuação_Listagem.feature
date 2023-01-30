#language: pt

Funcionalidade: Tabela de Pontuação - Listagem
Como usuário administrador ativo na Plataforma
Quero acessar a Tabela de pontos
Para visualizar os produtos e valores de cada perfil em todas as tabelas cadastradas

    BD 
        product_points_import_history
        product_points_import_resale
        account_campaign_product_points
        account_campaign_product_points_extra_info -- por perfil

-----    

Critérios de Aceitação:
Exibir breadcrumb
Acesso através do menu: Gerencial / Tabela de Pontos / Tabela de Pontuação
Exibir um botão "+Novo Produto" #confirmar pq não tem na tarefa e nem no escopo, mas Canon/Fischer que é a referência tem
Exibir um cabeçalho na tela "Tabela de Pontuação"
Disponibilizar os filtros: "SKU"; "EAN", "Nome do produto"; "Rede", "Categoria"; "Status"; "Tabela"; e botão "Buscar"
Trazer por padrão somente as tabelas Ativas no select "Tabela"
Trazer por padrão a última tabela importada e ativa, e não possibilitar deixar o filtro "Tabela" vazio
Trazer no filtro "Status": Ativo, Inativo e vazio
Trazer no filtro "Categoria": lista suspensa com as categorias desta campanha e opção vazio
Trazer no filtro "Tabela": lista suspensa concatenando o ID e nome das tabelas importadas e ativas
Disponibilizar autocomplete nos fitlros "SKU", "EAN" e "Nome do produto"
Disponibilizar uma seção "Redes vinculadas a esta Tabela" apenas para visualização
Aplicar paginação a cada 20 registros
Exibir acima da listagem o texto informativo: "Foram encontrados ** registros" que é atualizado conforme filtros aplixado X resultados na listagem
Exibir uma listagem com cabeçalho: "Categoria", "SKU", "EAN", "Produto", "Pontos", "Status" e botão "Ações" com as opções "Editar Dados" e "Histórico"
Exibir na coluna "Pontos" um ícone de informação (tooltip) que ao passar o mouse exibe no detalhamento os pontos por cargo
Apção "Editar" dentro de "Ações" abre um modal para realizar a edição dos dados deste produto nesta tabela: "Editar Dados"
Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do Relatório de Produtos
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Produtos" na extensão ".xlsx"

---

@manual
@Tarefa_#:61018
@ajuste_#:62516
@manual-result:success
@manual-last-tested:25-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-acessar-layout-e-tooltip-pontos.mp4,assets/A-tabela-de-pontuacao-acessar-layout-e-tooltip-pontos-II.png
    Cenário: Tabela de Pontuação - Acessar, Layout e Tooltip Pontos
        Dado que o admin esta logado
        Quando acessar o menu principal "Gerencial"
        E acionar o menu "Tabela de Pontos"
        E acionar o submenu "Tabela de Pontuação"
        Então o sistema redireciona para a tela da "Tabela de Pontuação"
        E por padrão traz no filtro "Tabela" a última tabela importada e ativa
        E lista no filtro "Tabela" somente as tabelas ativas
        E na listagem evidencia todos os produtos com os valores por perfil da respectiva Tabela 
        E entre os filtros exibe as "Redes"
        Quando o admin "passar" o mouse no 'ícone informativo' disponível na coluna "Pontos"
        Então um "tooltip" será exibido listando os pontos importados para cada perfil do respectivo produto
        Quando o admin visualizar todos os elementos da tela e da listagem
        Então os elementos da tela estão alinhados corretamente
            | Categoria    | SKU  | EAN           | Produto                        | Pontos                             | Status             | Botão/Ações              |
            | 'do produto' | 123-1| 1112224445553 | 'nome/modelo produto'          | 'tooltip de ponto para cada cargo' | 'Ativo ou Inativo' | Editar Dados / Histórico |
#62516 - Na coluna "Categorias" estão sendo listadas as SUBCATEGORIAS

@manual
@Tarefa_#:61018
@ajuste_#:62535
@manual-result:success
@manual-last-tested:25-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-tooltip-pontos-importacao-realizada-somente-com-pontos-vendedor.png,assets/A-tabela-de-pontuacao-tooltip-pontos-importacao-realizada-somente-com-pontos-vendedor-II.mp4
    Cenário: Tabela de Pontuação - Tooltip Pontos - Importação realizada somente com Pontos Vendedor
        Dado que o admin fez a importação da Tabela
        E preencheu somente os pontos do perfil Vendedor no arquivo
        Quando o admin acessar a tela da "Tabela de Pontuação"
        E filtrar por essa respectiva Tabela que foi importada somente com a coluna Pontos Vendedor preenchida
        Então o sitema vai exibir na listagem todos os produtos da tabela
        Quando o admin "passar" o mouse no 'ícone informativo' disponível na coluna "Pontos"
        Então um "tooltip" será exibido listando os pontos para cada perfil do respectivo produto
        Mas apenas o perfil Vendedor será exibido ou ... #E traz os outros perfis com valor zero, pois forma importados vazios na tabela (confirmar comportamento e atulizar cenário)
#62535 - Tooltip de tabela Reativada está com pontuação zerada

@manual
@Tarefa_#:61018
@manual-result:success
@manual-last-tested:20-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-filtrar-por-outra-tabela.mp4
    Cenário: Tabela de Pontuação - Filtrar por outra Tabela
        Dado que o admin esta na listagem da "Tabela de Pontuação"
        Quando alterar a tabela no select "Tabela" por outra da lista
        E acionar o botão "Buscar"
        Então a listagem evidencia todos os produtos/valores da respectiva Tabela filtrada
        E em "Ações" lista as opções "Editar Dados" e "Histórico"
    #fazer evidência de tabelaS com produtos e valores diferentes



@manual
@Tarefa_#:61018
@ajuste_#:62519
@ajuste_#:62521
@ajuste_#:62525
@manual-result:success
@manual-last-tested:26-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-filtrar-I.png,assets/A-tabela-de-pontuacao-filtrar-II.png,assets/A-tabela-de-pontuacao-filtrar-III.mp4,assets/A-tabela-de-pontuacao-filtrar-IV.mp4,assets/A-tabela-de-pontuacao-filtrar-V.mp4
    Esquema do Cenário: Tabela de Pontuação - Filtrar
        Dado que o admin esta na listagem da "Tabela de Pontuação"
        E com um tabela 'xpto' no filtro "Tabela"
        Quando realizar uma busca através dos filtros com dados não existentes nesta tabela
        E acionar o botão "Buscar"
        Então o sistema retorna com a mensagem "Nenhuma movimentação encontrada"
        Quando preencher todos, alguns ou um dos filtros "<SKU>", "<EAN>", "<Produto>", "<Rede>", "<Categoria>", "<Status>" com valores existentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar o valor no texto informativo " Foram encontrados ** registros"
        E exibirá na listagem somente o(s) registro(s) respectivo(s) à busca conforme "<Resultado do sistema>"
            Exemplos:
            | "SKU"           | "EAN"           | "Produto"                         | "Rede"     | "Categoria" | "Status"  | <Resultado do sistema>                                                             |
            | 'sku existente' |                 |                                   |            |             |           | Exibe na listagem somente o produto do respectivo SKU filtrado                     |
            |                 | "ean existente" |                                   |            |             |           | Exibe na listagem somente o produto do respectivo EAN filtrado                     |
            |                 |                 | "produto existente/nome completo" |            |             |           | Exibe na listagem todos os produtos que contém em seu nome/modelo o termo filtrado |
            |                 |                 | "produto existente/parte do nome" |            |             |           | Exibe na listagem todos os produtos que contém em seu nome/modelo o termo filtrado |
            |                 |                 |                                   | "da lista" |             |           | Exibe na listagem todos os produtos da rede filtrada                               |
            |                 |                 |                                   |            | "da lista"  |           | Exibe na listagem todos os produtos da categoria filtrada                          |
            |                 |                 |                                   |            | "da lista"  | "Ativo"   | Exibe somente os produtos Ativos desta tabela                                      |
            |                 |                 |                                   |            |             | "Inativo" | Exibe somente os produtos Inativos desta tabela                                    |
#62519 - Filtro SKU não funciona
#62521 - Filtro Rede não funcina
#62525 - Filtro Categora e Status ocorre erro e não filtra

@manual
@Tarefa_#:61018
@manual-result:success
@manual-last-tested:20-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-paginacao-e-transicao.mp4
    Cenário: Tabela de Pontuação - Paginação e transição
    Dado que o admin esta na tela de "Tabela de Pontuação"
    E existem registros gerando paginação
    Quando o admin transitar para as próximas páginas ou para as páginas anteriores
    Então o sistema irá redirecionar para as outras páginas sem erros



@manual
@Tarefa_#:61018
@ajuste_#:62530
@manual-result:success
@manual-last-tested:20-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-exportar-registros-I.mp4,assets/A-tabela-de-pontuacao-exportar-registros-II.mp4,assets/relatorio-de-produtos-I.xlsx,assets/relatorio-de-produtos-II.xlsx,assets/A-tabela-de-pontuacao-exportar-registros-III.png
    Cenário: Tabela de Pontuação - Exportar Registros
    Dado que o admin esta na listagem de "Tabela de Pontuação"
    E realizou uma busca que "filtrou" os resultados existentes na tabela do filtro
    Quando acionar o botão "Exportar Registros"
    Então o sistema irá fazer o download do arquivo "Relatório de Produtos" em extensão ".xlsx"
    Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
    Quando o admin não realizar buscas
    E acionar o botão "Exportar Registros"
    Então o sistema irá fazer o download do arquivo "Relatório de Produtos" em extensão ".xlsx"
    E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
    Quando realizar uma busca com "Nenhum registro encontrado."
    Então o botão "Exportar Registros" não será exibido na tela
#62530 - Nome do relatório com acento.


@manual
@Tarefa_#:66854
@manual-result:success
@manual-last-tested:14-12-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-redes.png,assets/A-tabela-de-pontuacao-redes.mp4
    Cenário: Tabela de Pontuação - Redes
        Dado que o admin esta na listagem de "Tabela de Pontuação"
        E todos os campos estão alinhados corretamente
        Quando o admin filtrar por determninada tabela no campo "Tabela"
        E acionar o botão "Buscar"
        Então serão listados os produtos e as redes vinculadas à Tabela
        E no campo "Redes Vinculadas a esta tabela" serão demonstradas as redes, sem que se sobreponham

