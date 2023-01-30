#language: pt

Funcionalidade: Tabela de Pontuação do Banking
Como usuário ativo no Banking
Quero acessar a tela de Tabela de Pontuação
Para visualizar os produtos com suas pontuações e categorias
    
    BD
        user_hierarchical_level

-----

Critérios de Aceitação:
Todos os perfis tem acesso a tela "Tabela de Pontuação"
Será disponibilizada no menu principal "Tabela de Pontuação"
Exibir na tela o título: "Tabela de Pontuação"
Exibir na tela os seguintes filtros: 
 - "Categoria" - sendo uma lista suspensa de todas as categorias; 
 - "Produto" - sendo um campo de autocomplete com o nome do produto;
 - "Vigência" - sendo a tabela e vínculo com as Revendas
Trazer no filtro "Vigência" por padrão a tabela mais recente cadastrada
Exibir texto informativo: "Nenhum registro encontrado." - seja quando não existe nenhum cadastro ou quando não existem resultadso para a busca realizada
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir um gride/listagem com o seguinte cabeçalho: "Categoria", "SKU", "EAN", "Produto" e "Pontos"
Exibir na listagem os dados conforme cabeçalho
Exibir produtos somente com Status "ATIVO"
Exibir na listagem produtos ativos com valor igual ou maior que zero
Exibir as tabelas conforme vínculo com a revenda do usuário logado
Exibir aos usuários de perfil "Vendedores": somente a pontuação da coluna "Pontos Vendedor"
Exibir aos usuários de perfil "Gerente Direto": somente a pontuação da coluna "Pontos Gerente Direto"
Exibir aos usuários de perfis "Supervisores e Subgerentes": somente a pontuação da coluna "Pontos Supervisor"
Exibir aos usuários de perfil "Gerente Regional": somente a pontuação da coluna "Pontos Gerente Regional"
Fazer paginação com 20 registros por página
Disponibilizar um botão "Voltar" que redireciona de volta para a "Home"



@manual
@tarefa_#:61022
@ajuste_#:62833
@manual-result:success
@manual-last-tested:26-10-2022
@manual-test-evidence:assets/B-tabela-de-pontuacao-acessar-validar-layout-e-voltar-vendedor.mp4,assets/B-tabela-de-pontuacao-acessar-validar-layout-e-voltar-gerente-direto.mp4,assets/B-tabela-de-pontuacao-acessar-validar-layout-e-voltar-supervisor.mp4,assets/B-tabela-de-pontuacao-acessar-validar-layout-e-voltar-gerente-regional.mp4,assets/A-tabela-de-pontuacao-filtro-tabela-II.mp4
    Cenário: Tabela de Pontuação - Acessar, validar Layout e Voltar
        Dado que um usuário de cada cargo está logado no "Banking"
        Quando clicar no menu principal
        E clicar no submenu "Tabela de Pontuação"
        Então o sistema redirecionará o usuário para a "Tabela de Pontuação"
        Quando o usuário de cada perfil visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o usuário acionar o botão "Voltar"
        Então o sistema redirecionará de volta para a "Home" do Banking
            | Cargo              | Pontuação                            |
            | "Vendedor"         | 'somente do perfil Vendedor'         |
            | "Gerente Direto"   | 'somente do perfil Gerente Direto'   |
            | "Supervisor"       | 'somente do perfil Supervisores'     |
            | "Gerente regional" | 'somente do perfil Gerente Regional' |
#62833 - Não está filtrando as tabelas de acordo com os vínculos do usuário com o distribuidor x rede


@manual
@tarefa_#:61022
@ajuste_#:63025
@manual-result:success
@manual-last-tested:14-11-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-sem-tabela-para-revenda-do-usuario-corrigido.png
    Cenário: Tabela de Pontuação - Sem Tabela para Revenda do usuário
        Dado que um usuário está logado no "Banking"
        E não existem tabelas cadastrados para sua Revenda
        Quando o usuário acessar a tela "Tabela de Pontuação"
        Então o filtro "Tabela" fica vazio
        E a listagem com a mensagem "Nenhum registro encontrado" 
        Quando existem tabelas cadastrados para sua Revenda
        Mas estão INATIVAS
        Então o filtro "Tabela" fica vazio
        E a listagem com a mensagem "Nenhum registro encontrado"    
#63025 - Qdo não há tabela vinculada para a revenda, aparecem produtos indevidos no banking do usuário


@manual
@tarefa_#:61022
@ajuste_#:62833
@manual-result:success
@manual-last-tested:26-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-filtro-tabela-I.png,assets/A-tabela-de-pontuacao-filtro-tabela-II.mp4
    Cenário: Tabela de Pontuação - Filtro Tabela
        Dado que um usuário está na tela "Tabela de Pontuação"
        E existe várias tabelas cadastradas para a Revenda do usuário e também para outras Revendas
        Quando o usuário acionar o filtro "Tabela"
        Então somente as tabelas vinculadas à sua Revenda 
        E ATIVAS serão listadas
        Quando o usuário selecionar outra tabela no filtro
        E acionar o botão "Buscar"
        Então o sistema atualiza a listagem de Produtos exibindo os produtos e valores desta outra tabela
#62833 - Não está filtrando as tabelas de acordo com os vínculos do usuário com o distribuidor x rede


@manual
@tarefa_#:61022
@ajuste_#:62921
@manual-result:success
@manual-last-tested:25-10-2022
@manual-test-evidence:assets/B-tabela-de-pontuacao-paginacao-filtrar-I.png,assets/B-tabela-de-pontuacao-paginacao-filtrar-II.png,assets/B-tabela-de-pontuacao-filtrar.png,assets/B-tabela-de-pontuacao-filtrar-II.png,assets/B-tabela-de-pontuacao-filtrar-III.png,assets/B-tabela-de-pontuacao-filtrar-IV.mp4
    Esquema do Cenário: Tabela de Pontuação - Filtrar
        Dado que um usuário está na tela "Tabela de Pontuação"
        E por padrão a tabela mais recente está no filtro "Vigência"
        Quando realizar buscas nos campos "<Categoria>" e "<Produto>"
        E acionar o botão "Buscar"
        Então o sistema realiza a busca nos registros da tabela selecionada
        E atualiza o valor no texto informativo registros encontrados conforme 
        E atualiza os registros da listagem conforme "<Resultado do sistema>"
            Exemplos:
            | <Categoria>              | <Produto>                                                  | <Resultado do sistema>                                                                   |
            | 'categoria com produtos' |                                                            | Lista somente os produtos da categoria respectiva                                        |
            | 'categoria sem produtos' |                                                            | Listagem fica vazia com a mensagem "Nenhum registro encontrado"                          |
            |                          | 'termo inexistente. Ex.: Banana'                           | Listagem fica vazia com a mensagem "Nenhum registro encontrado"                          |
            | 'categoria com produtos' | 'termo existente e da categoria. Ex.: Microondas'          | Lista somente o(s) produto(s) que contém o termo digitado e seja da respectiva categoria |
            |                          | 'termo existente e da categoria. Ex.: Micro'               | Lista somente o(s) produto(s) que contém o termo digitado                                |
            | 'Fogão'                  | 'termo existente, mas de outra categoria. Ex.: Microondas' | Listagem fica vazia com a mensagem "Nenhum registro encontrado"                          |
#62921- Demonstrando a Subcategoria na coluna Categoria, impedindo o filtro pela categoria


@manual
@tarefa_#:61022
@manual-result:success
@manual-last-tested:25-10-2022
@manual-test-evidence:assets/B-tabela-de-pontuacao-alterar-produto-para-atualizar-no-banking-I.mp4,assets/B-tabela-de-pontuacao-alterar-produto-para-atualizar-no-banking-II.mp4,assets/B-tabela-de-pontuacao-alterar-produto-para-atualizar-no-banking-III.mp4
    Esquema do Cenário: Tabela de Pontuação - Alterar produto para atualizar no Banking
        Dado que um usuário está na tela "Tabela de Pontuação"
        E existem "Produtos" na listagem com status "Ativo", de diferentes "Categorias" e "Pontos" diversos
        Quando o administrador da campanha via Plataform realizar alterações nos produtos
        E o usuário do banking atualizar a página ou acessá-la novamente
        Então a listagem de produtos é atualizada conforme "<Resultado do sistema>"
            Exemplos:
            | Ação do administrador                                      | "<Resultado do sistema>"                                                                      |
            | alterar o "Status" de um produdo de "Ativo" para "Inativo" | o produto agora inativo não mais será exibido na listagem                                     |
            | alterar o "Status" de um produdo de "Inativo" para "Ativo" | o produto agora Ativo é exibido na listagem                                                   |
            | alterar o "Pontos" de um produdo "Ativo"                   | Os Pontos deste produto será atualizado na listagem                                           |
            | alterar o "Pontos" de um produdo "Inativo"                 | O produto continua não sendo exibido, pois é Inativo                                          |
            | alterar o nome do "Produto" "Ativo"                        | O nome deste produto será atualizado na listagem e também na busca pelo novo 'nome'           |
            | alterar o nome do "Produto" "Inativo"                      | O produto continua não sendo exibido, pois é Inativo                                          |
            | alterar a "Categoria" de um produto "Ativo"                | A categoria deste produto será atualizada na listagem e também na busca pela "Categoria" nova |
            | alterar a "Categoria" de um produto "Inativo"              | O produto continua não sendo exibido, pois é Inativo                                          |


@manual
@tarefa_#:61022
@manual-result:success
@manual-last-tested:25-10-2022
@manual-test-evidence:assets/B-tabela-de-pontuacao-inativar-tabela-para-remover-do-banking.mp4
    Cenário: Tabela de Pontuação - Inativar tabela para remover do Banking
        Dado que um usuário está na tela "Tabela de Pontuação"
        E a tabela "Tabela Teste" com status ativo esta sendo exibida no filtro "Vigência"
        E esta listando os produtos e valores respectivos à tabela
        Quando o administrador da campanha via Plataform INATIVAR essa tabela
        E o usuário do banking atualizar a página ou acessá-la novamente
        Então a tabela não será mais listada no filtro "Vigência"


@manual
@tarefa_#:61022
@ajuste_#:62908
@manual-result:success
@manual-last-tested:26-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-paginacao.mp4
    Cenário: Tabela de Pontuação - Paginação
        Dado que um usuário está na tela "Tabela de Pontuação"
        E a quantidade de registros ultrapassou 20 linhas
        Então deve-se gerar paginação
        Quando o usuário transitar para as próximas páginas ou para as páginas anteriores
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cada respectiva página sem apresentar erros
#62908 - Sem paginação e sem informação da quantidade de registros