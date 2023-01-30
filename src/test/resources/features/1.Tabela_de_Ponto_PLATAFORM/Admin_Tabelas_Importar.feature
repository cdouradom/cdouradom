#language: pt

Funcionalidade: Tabelas - Importação de Tabela de Pontos
Como usuário administrador ativo na Plataforma
Quero acessar a tela de importaçãp de tabelas
Para visualizar as tabelas cadastradas, editar e fazer novas importações

BD 
    product_points_import_history
    account_campaign_product_points

-----    

Critérios de Aceitação:
Exibir breadcrumb
Acessado através do menu: Gerencial / Tabela de Pontos / Botão "Nova Tabela"
Exibir um botão "Download Modelo" que baixa o arquivo conforme requerido em escopo/tarefa
Exibir um cabeçalho na tela "Importar"
Disponibilizar os campos para cadastro: "Título", "Rede",  "Início vigência", "Fim vigência" e botões "Cancelar" que retorna para a listagem e "Enviar" que faz as validações para cadastro do arquivo
Disponibilizar checkbox "Selecionar Todas" que adiciona e/ou remoce as tags de todas as "Redes"
Todos os campos são de preenchimento obrigatório
O "Início da Vigência" deve ser data futura obrigatoriamente
Os campos de datas devem ter um calendário para seleção
O "Fim vigência" deve ser maior que o "Início da Vigência"
No campo "Rede" autocomplete gerando tags, permitindo ao admin adicionar ou remover rede
Botão de upload "Tabela de pontuação* (xls, xlsx ou ods)" abrir os arquivos filtrando as extensões dos arquivos do admin
Não permitir duplicidade de Título em diferentes tabelas independente do status
Não permitir cadastro de tebelas com a mesma vigência para as mesmas redes com tabelas Ativas
Não permitir importação parcial
Para linhas duplicadas no arquivo pelo SKU e EAN, exibir críticas apenas nas linhas com duplicadades
Validar no arquivo - todos os campos são de preechimento obrigatório
Validar no arquivo - aceitar pontos somente com valores maiores ou iguais a zero
Validar no arquivo - aceitar pontos somente no formato determinado (Ex.: 10, 100, 1000.00)
Exibir todas as críticas em uma listagem
Somente quando houverem críticas: Exibir um botão "Voltar" para retornar a lista de tabelas (listagem de pendências)
Somente quando houverem críticas: Disponibilizar botão "Exportar Erros" que faz download das pendências conforme modelo "Relatório de erros de importação.xlsx"
Somente quando houverem críticas: Exibir um texto informativo:
    "Importante: o arquivo não foi importado, pois contém pendências. Verifique os erros apresentados, corrija-os e realize uma nova importação."

---

@manual
@Tarefa_#:61014
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-importar-tabela-acessar-validar-layout-baixar-modelo-e-cancelar.mp4
    Cenário: Importar Tabela - Acessar, validar layout, baixar modelo e Cancelar
        Dado que o admin está na tela da tela de "Lista de Tabelas"
        Quando acionar o botão "Nova Tabela"
        Então o sistema redireciona para a tela de "Importar tabela"
        Quando o usuário visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o admin acionar o botão "Download Modelo"
        Então o sistema faz o Download do arquivo "Modelo Tabela de Pontuação.xlsx"
        E abre com a estrutura das colunas:
            | SKU | EAN | Produto | Categoria | Subcategoria | Pontos Vendedor | Pontos Gerente Direto | Pontos Supervisor | Pontos Gerente Regional |
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Lista de Tabelas"


@manual
@Tarefa_#:61014
@ajuste_#:62368
@ajuste_#:62371
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-importar-tabela-campos-vazios-ou-invalidos-I.png,assets/A-importar-tabela-campos-vazios-ou-invalidos-II.png,assets/A-importar-tabela-campos-vazios-ou-invalidos-III.png,assets/A-importar-tabela-campos-vazios-ou-invalidos-IV.png,assets/A-importar-tabela-campos-vazios-ou-invalidos-V.png,assets/A-importar-tabela-campos-vazios-ou-invalidos-VI.png,assets/A-importar-tabela-campos-vazios-ou-invalidos-VII.mp4,assets/A-importar-tabela-campos-vazios-ou-invalidos-VIII.png,assets/A-importar-tabela-campos-vazios-ou-invalidos-IX.png
    Cenário: Importar Tabela - Campos vazios ou inválidos
        Dado que o admin acessou a tela de "Importar tabela"
        Quando não preencher os campos "<Início da Vigência*>", "<Fim da Vigência*>", "<Título*>", "<Redes>" e ">Tabela de pontuação>"
        E acionar o botão "Enviar"
        Então o sistema exibe as críticas em todos os campos por serem obrigatórios conforme "<Resposta do sistema>"
            Exemplos:
            | <Início da Vigência> | <Fim da Vigência> | <Título>         | <Redes> | <Tabela de pontuação>                 | <Resposta do sistema>                                           |
            |                      | '31/10/2022'      | 'Tabela Outubro' | 'Todas' | 'upload do arquivo modelo preenchido' | 'Preencha este Campo'                                           |
            | '20/10/2022'         |                   | 'Tabela Outubro' | 'Todas' | 'upload do arquivo modelo preenchido' | 'Preencha este Campo'                                           |
            | '20/10/2022'         | '31/10/2022'      |                  | 'Todas' | 'upload do arquivo modelo preenchido' | 'Preencha este Campo'                                           |
            | '20/10/2022'         | '31/10/2022'      | 'Tabela Outubro' |         |                                       | 'Vincule pelo menos uma rede à tabela.'                         |
            | '20/10/2022'         | '31/10/2022'      | 'Tabela Outubro' | 'Todas' |                                       | 'Selecione a tabela'                                            |
            | '30/09/2022'         | '31/10/2022'      | 'Tabela Outubro' | 'Todas' | 'upload do arquivo modelo preenchido' | 'Data inválida. A data de início de vigência deve ser futura.'  |
            | '30/10/2022'         | '29/10/2022'      | 'Tabela Outubro' | 'Todas' | 'upload do arquivo modelo preenchido' | 'A data final de vigência deve ser maior que a data de início.' |
            | '20/10/2022'         | '31/10/2022'      | 'Tabela Outubro' | 'Todas' | 'Título igual de uma tabela ativa'    | Já existe uma tabela cadastrada com este título                 |
            | '20/10/2022'         | '31/10/2022'      | 'Tabela Outubro' | 'Todas' | 'Título igual de uma tabela inativa'  | Já existe uma tabela cadastrada com este título                 |
#Fazer tbm com Título igual de uma tabela ativa/inativa, mas com apenas um espaço no final que os diferencia > o ideal é barrar
#62368- Não está criticando o campo "Rede" quando ele está vazio
#62371- Ao processar sem anexar arquivo - Página de erro

@manual
@Tarefa_#:61014
@ajuste_#:62353
@manual-result:success
@manual-last-tested:25-10-2022
@manual-test-evidence:assets/A-importar-tabela-arquivo-fora-de-estrutura-I.mp4,assets/A-importar-tabela-arquivo-fora-de-estrutura-II.mp4,assets/A-importar-tabela-arquivo-fora-de-estrutura-III.mp4
    Cenário: Importar Tabela - Arquivo fora da estrutura
        Dado que o admin acessou a tela de "Importar tabela"
        Quando inserir um arquivo fora da estrutura do modelo ou em extensão diferente de 'xls, xlsx ou ods'
        Então o sistema vai exibir a crítica "Formato inválido. Cliquem em Download Modelo"
        E não faz o cadastro do arquivo
#62353 - Importação no formato ODS ocorre erro na página        
#cabeçalho diferente tbm precisa barrar
#menos e mais colunas tbm precisa barrar


@manual
@Tarefa_#:61014
@ajuste_#:62392
@manual-result:success
@manual-last-tested:26-10-2022
@manual-test-evidence:assets/A-importar-tabela-arquivo-com-sucesso-em-todas-as-linhas.mp4,assets/A-importar-tabela-arquivo-com-sucesso-em-todas-as-linhas-II.mp4,assets/A-importar-tabela-arquivo-com-sucesso-em-todas-as-linhas-II.xlsx
    Esquema do Cenário: Importar Tabela - Arquivo com Sucesso em todas as linhas
        Dado que o admin acessou a tela de "Importar tabela"
        E preencheu corretamente os campos "Título", "Início da Vigência*", "Fim da Vigência*" e "Redes"
        E todas as Redes selecionadas não possuem outra tabela ativa com a mesma vigência (total ou parcial)
        Quando anexar em "Tabela de pontuação" um arquivo conforme modelo 
        E com valores válidos nas colunas nas colunas "<SKU>", "<EAN>", "<Produto>", "<Categoria>", "<Subcategoria>", "<Pontos Vendedor>", "<Pontos Gerente Direto>", "<Pontos Supervisor>" e "<Pontos Gerente Regional>"
        E acionar o botão "Enviar"
        Então o sistema valida as informação do cadastro/arquivo
        E vai cadastrar essa tabela com status "Ativo", registrando todos os valores conforme "<Comportamento do sistema>"
        E vai exibir um modal/alerta de "Tabela cadastrada com sucesso"
        E redirecionar o admin de volta para a "Lista de Tabelas" #se for modal, ao clicar em Ok
        E exibirá a nova tabela na listagem da "Lista de Tabelas"
            Exemplos:
            | <SKU>      | <EAN>         | <Produto>      | <Categoria> | <Subcategoria> | <Pontos Vendedor> | <Pontos Gerente Direto> | <Pontos Supervisor> | <Pontos Gerente Regional> | <Comportamento do sistema>                                                                                                    |
            | SKU01      | 0001112223456 | Produto 01     | Forno       | Microondas     | 100               | 10.10                   | 00                  | 10                        | Cadastra valor exato com 2 casas decimais para cada perfil                                                                    |
            | SKU02      | 0001112223457 | Produto 02     | Forno       | Microondas     | 200               | 'vazio'                 | 00                  | 25.33                     | Cadastra valor exato com 2 casas decimais para cada perfil, e deixa zero onde esta vazio                                      |
            | SKU03      | 0001112223458 | Produto 03     | Forno       | Microondas     | 3000              | 30.33                   | 'vazio'             | 35.08                     | Cadastra valor exato com 2 casas decimais para cada perfil, e deixa zero onde esta vazio                                      |
            | SKU04      | 0001112223459 | Produto 04     | Forno       | Microondas     | 3333.00           | 130                     | 50                  | 333                       | Cadastra valor exato com 2 casas decimais para cada perfil                                                                    |
            | SKU05      | 0001112223460 | Produto 05     | Forno       | Microondas     | 10000.00          | 100.50                  | 51                  | 88.99                     | Cadastra valor exato com 2 casas decimais para cada perfil                                                                    |
            | SKU06      | 0001112223461 | Produto 06     | Forno       | Microondas     | 15000.50          | 1005.99                 | 5.5                 | 'vazio'                   | Cadastra valor exato com 2 casas decimais para cada perfil                                                                    |
            | SKU07      | 0001112223462 | Produto 07     | Forno       | Microondas     | 3000.99           | 300                     | 500                 | 80.57                     | Cadastra valor exato com 2 casas decimais para cada perfil, e deixa zero onde esta vazio                                      |
            | SKU08      | 0001112223465 | Produto 08     | Forno       | Microondas     | 0                 | 'vazio'                 | 'vazio'             | 'vazio'                   | Cadastra valor exato com 2 casas decimais para o Venddedor, e deixa zero onde esta vazio                                      |
            | 'novo SKU' | 'novo EAN'    | Nono Produto A | Forno       | Microondas     | 500.05            | 50.07                   | 55                  | 0                         | Cadastra o produto com status Ativo; Cadastra valor exato com 2 casas decimais para cada perfil                               |
            | 'novo SKU' | 'novo EAN'    | Novo Produto B | Forno       | Microondas     | 1000              | 'vazio'                 | 1                   | 'vazio'                   | Cadastra o produto com status Ativo; Cadastra valor exato com 2 casas decimais para cada perfil, e deixa zero onde esta vazio |
#62392 - Não está permitindo importar arquivo pontos vazios para os perfis diferentes de vendedor.
#valores de exemplos
#cadastrar novos produtos com status Ativo, desde que SKU e EAN não existam, e que Categoria e Subcategoria existam
#valores podem ser vazios nas colunas de perfis: Gerente Direto, Supervisor e Gerente Regional


@manual
@Tarefa_#:61014
@ajuste_#:62427
@ajuste_#:62428
@ajuste_#:62433
@ajuste_#:62438
@ajuste_#:62610
@manual-result:success
@manual-last-tested:14-11-2022
@manual-test-evidence:assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-I.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-II.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-III.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-IV.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-V.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-VI.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-VII.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-IX.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-X.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XI.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XII.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XIII.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XV.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XVII.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XVIII.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XIX.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XX.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXI.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXII.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXIII.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXIV.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXV.mp4,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXVI.png,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXVII.png,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXVIII.png,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXIX.png,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXX.png,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXXI.png,assets/A-importar-tabela-validacoes-no-arquivo-com-valores-invalidos-XXXII.png
Esquema do Cenário: Importar Tabela - Validações no arquivo com valores inválidos
        Dado que o admin acessou a tela de "Importar tabela"
        E preencheu corretamente os campos "Título", "Início da Vigência", "Fim da Vigência" e "Rede"
        E todas as Redes selecionadas não possuem outra tabela ativa para a mesma vigência (total ou parcial)
        E anexou em "Tabela de pontuação" um arquivo conforme modelo.
        Mas preencheu o arquivo com valores inválidos ou vazios nas colunas "<SKU>", "<EAN>", "<Produto>", "<Categoria>", "<Subcategoria>", "<Pontos Vendedor>", "<Pontos Gerente Direto>", "<Pontos Supervisor>" e "<Pontos Gerente Regional>"
        Quando acionar o botão "Enviar"
        Então a plataforma deverá fazer as validações no arquivo e apresentar "<Resposta do sistema>"
        E listar os "erros" na mesma tela conforme todas as críticas seguindo a estrutura: "Linha" , "Coluna", "Valor" e "Crítica"
        E apresentará um botão "voltar" ao final da página
        E disponibilizará um botão "Exportar Erros" ao final da página #confirmar
        E deve exibir um texto informativo ao final da tela #confirmar
        | "Importante: o arquivo não foi importado, pois contém pendências. Verifique os erros apresentados, corrija-os e realize uma nova importação." |
        Quando o admin clicar em "Exportar Erros"
        Então o sistema faz o download do arquivo "Relatório de erros de importação.xlsx" conforme críticas listadas      
        Quando o admin acionar o botão "Voltar" ou "Cancelar"
        Então o sistema retorna para a "Lista de tabelas"
            Exemplos:
            | <SKU>          | <EAN>             | <Produto>       | <Categoria>      | <Subcategoria>   | <Pontos Vendedor> | <Pontos Gerente Direto> | <Pontos Supervisor> | <Pontos Gerente Regional> | <Comportamento do sistema>                                                                                  |
            | 'vazio'        | 'vazio'           | 'vazio'         | 'vazio'          | 'vazio'          | 'vazio'           | 'vazio'                 | 'vazio'             | 'vazio'                   | Campos de preenchimento obrigatório: SKU, EAN, Produto, Categoria, Subcategoria e Pontos Vendedor           |
            | 'vazio'        | 0001112223456     | Produto 01      | Forno            | Microondas       | 100               | 10.10                   | 00                  | 10                        | Campo de preenchimento obrigatório: SKU                                                                     |
            | 'duplicado1'   | '1111111111111'   | Produto 02      | Forno            | Microondas       | 200               | 20.50                   | 00                  | 25.33                     | SKU em duplicidade com a linha abaixo, mas dar crítica apenas na linha abaixo que é a duplicada desta linha |
            | 'duplicado1'   | '1111111111111'   | Produto 03      | Forno            | Microondas       | 3000              | 30.33                   | 00                  | 35.08                     | SKU em duplicidade no arquivo [com a linha acima]                                                           |
            | SKU04          | 'vazio'           | Produto 04      | Forno            | Microondas       | 3333.00           | 130                     | 50                  | 333                       | Campo de preenchimento obrigatório: EAN                                                                     |
            | 'novo SKU'     | '123456789'       | Produto 04      | Forno            | Microondas       | 3333.00           | 130                     | 50                  | 333                       | O EAN deve conter 13 dígitos                                                                                |
            | 'novo SKU'     | '000123456789100' | Produto 04      | Forno            | Microondas       | 3333.00           | 130                     | 50                  | 333                       | O EAN deve conter 13 dígitos                                                                                |
            | SKU-021        | 'duplicado1'      | Produto 02      | Forno            | Microondas       | 200               | 20.50                   | 00                  | 25.33                     | EAN em duplicidade com a linha abaixo, mas dar crítica apenas na linha abaixo que é a duplicada desta linha |
            | SKU-022        | 'duplicado1'      | Produto 03      | Forno            | Microondas       | 3000              | 30.33                   | 00                  | 35.08                     | EAN em duplicidade no arquivo [com a linha acima]                                                           |
            | 'já existente' | 'novo EAN'        | Produto ABC     | Forno            | Microondas       | 3000              | 30.33                   | 00                  | 35.08                     | SKU em duplicidade                                                               |
            | 'novo SKU'     | 'já existente'    | Produto ABC     | Forno            | Microondas       | 3333.00           | 130                     | 50                  | 333                       | Já existe um produto cadastrado com este EAN                                                                |
            | SKU05          | '2222222222222'   | 'vazio'         | Forno            | Microondas       | 10000.00          | 100.50                  | 51                  | 88.99                     | Informe o Produto                                                               |
            | SKU06          | '3333333333333'   | Produto 06      | 'vazio'          | Microondas       | 15000.50          | 1005.99                 | 5.5                 | 500                       | Informe a Categoria                                                             |
            | SKU07          | '4444444444444'   | Produto 06      | 'não cadastrada' | Microondas       | 15000.50          | 1005.99                 | 5.5                 | 500                       | Categoria não cadastrada                                                                                    |
            | SKU08          | '5555555555555'   | Produto 06      | Forno            | 'vazio'          | 15000.50          | 1005.99                 | 5.5                 | 500                       | Informe a Subcategoria                                                            |
            | SKU09          | '6666666666666'   | Produto 06      | Forno            | 'não cadastrada' | 15000.50          | 1005.99                 | 5.5                 | 500                       | Subcategoria não cadastrada                                                                                 |
            | 'novo SKU'     | 'novo EAN'        | Produto 06      | 'não cadastrada' | 'não cadastrada' | 15000.50          | 1005.99                 | 5.5                 | 500                       | Categoria não cadastrada; Subcategoria não cadastrada                                                       |
            | 'SKU inativo'  | '0123012301230'   | Produto Inativo | Forno            | Microondas       | 15000.50          | 1005.99                 | 5.5                 | 500                       | Produto inativo.                                                                                            |
            | SKU10          | '6666666666666'   | Produto 06      | Forno            | Microondas       | 'vazio'           | 1005.99                 | 5.5                 | 500                       | Campo de preenchimento obrigatório: Pontos Vendedor                                                         |
            | SKU-10         | 0001112224443     | Produto SKU-10  | Forno            | Microondas       | -10               | -10                     | -10                 | -10                       | O valor informado deve ser maior ou igual a 0 (zero)                                                        |
            | SKU-11         | 0001112223463     | Produto SKU-11  | Forno            | Microondas       | -10.00            | -10.00                  | -10.00              | -10.00                    | O valor informado deve ser maior ou igual a 0 (zero)                                                        |
            | SKU-12         | 0001112223464     | Produto SKU-12  | Forno            | Microondas       | 10.000            | 10.000                  | 10.000              | 10.000                    | Os pontos deve conter no máximo duas casas decimais                                                                                             |
            | SKU-13         | 0001112223465     | Produto SKU-13  | Forno            | Microondas       | 10.033            | 10.033                  | 10.033              | 10.033                    | Os pontos deve conter no máximo duas casas decimais                                                                                              |
            | SKU-13         | 0001112223465     | Produto SKU-13  | Forno            | Microondas       | 1.000,00          | 1.000,00                | 1.000,00            | 1.000,00                  | Apenas ponto será aceito como separador de decimal                                                                                              |
            | SKU-13         | 0001112223465     | Produto SKU-13  | Forno            | Microondas       | 1.000.00          | 1.000.00                | 1.000.00            | 1.000.00                  | Apenas um ponto será aceito como separador de decimal                                                                                             |
            | SKU-13         | 0001112223465     | Produto SKU-13  | Forno            | Microondas       | 5,00              | 5,00                    | 5,00                | 5,00                      | Apenas ponto será aceito como separador de decimal                                                                                              |
            | SKU-13         | 0001112223465     | Produto SKU-13  | Forno            | Microondas       | 15,00             | 15,00                   | 15,00               | 15,00                     | Apenas ponto será aceito como separador de decimal                                                                                              |
            | SKU-13         | 0001112223465     | Produto SKU-13  | Forno            | Microondas       | 1.555,57          | 1.555,57                | 1.555,57            | 1.555,57                  | Apenas ponto será aceito como separador de decimal                                                                                             |
            | SKU-13         | 0001112223465     | Produto SKU-13  | Forno            | Microondas       | 0,05              | 0,05                    | 0,05                | 0,05                      | Apenas ponto será aceito como separador de decimal                                                                                             |
        #coluna pontos: Aceitar somente ponto (.) para separação de decimal.
        #coluna pontos: Não aceitar vírgula como separador de decimal ou o ponto como identificador de milhar
        #coluna pontos: Campo decimal, aplicar máscara de duas casas sempre X.XX
        #coluna pontos: Não aplicar arredondamentos
#62427 - Ajustar crítica quando o SKU já estiver cadastrado na plataforma    
#62428 - Ajustar crítica quando o EAN já estiver cadastrado na plataforma    
#62433 - Ajustar críticas quando Categoria + Subcategoria não estiverem cadastradas na plataforma
#62438 - Ajustar crítica quando Pontos Vendedor estiver VAZIO
#62610 - Está permitindo importar tabela completamente vazia

#62407 - SUGESTÃO - Ajustar crítica quando EAN estiver vazio ou com menos de 13 dígitos
#62441 - SUGESTÃO - Melhorar crítica dos campos de pontos, especificando o campo


@manual
@Tarefa_#:61014
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-importar-tabela-linhas-com-erros-e-linha-corretas-no-mesmo-arquivo.mp4
    Cenário: Importar Tabela - Linhas com erros e linha corretas no mesmo arquivo
        Dado que o admin acessou a tela de "Importar tabela"
        E preencheu corretamente os campos "Título", "Início da Vigência*", "Fim da Vigência*" e "Rede"
        E todas as Redes selecionadas não possuem outra tabela ativa para a mesma vigência (total ou parcial)
        E anexou em "Tabela de pontuação" um arquivo conforme modelo 
        Mas preencheu o arquivo com válores válidos e inválidos também
        Quando acionar o botão "Enviar"
        Então a plataforma deverá fazer as validações no arquivo
        E listar somente as linhas com "erros" na mesma tela conforme todas as críticas seguindo a estrutura: "Linha" , "Coluna", "Valor" e "Crítica"
        E as linhas com sucesso não serão listadas
        Mas também não serão cadastradas, pois não é permitido cadastro parcial de Tabela de Pontos
        E apresentará um botão "voltar" ao final da página
        E disponibilizará um botão "Exportar Erros" ao final da página #confirmar
        E deve exibir um texto informativo ao final da tela #confirmar
        | "Importante: o arquivo não foi importado, pois contém pendências. Verifique os erros apresentados, corrija-os e realize uma nova importação." |
        Quando o admin clicar em "Exportar Erros"
        Então o sistema faz download do arquivo "Relatório de erros de importação.xlsx" conforme críticas listadas
        Quando o admin acionar o botão "Voltar" ou "Cancelar"
        Então o sistema retorna para a "Lista de tabelas"  


@manual
@Tarefa_#:61014
@ajuste_#:62324
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-importar-tabela-rede-com-outra-tabela-ativa-e-a-mesma-vigencia.mp4,assets/A-importar-tabela-redes-diferentes-na-mesma-vigencia.mp4
    Cenário: Importar Tabela - Rede com outra tabela ativa e a msm vigência
        Dado que o admin acessou a tela de "Importar tabela"
        E preencheu um 'Título' único
        E uma vigência válida de "01/12/2022" até "31/12/2022"
        E selecionou as "Redes" 'Rede Teste 1', 'Rede Teste 2' e 'Rede Teste 3'
        Mas a 'Rede Teste 1' já possui uma tabela ativa para essa vigência de "01/12/2022" até "31/12/2022"
        Quando acionar o botão "Enviar"
        Então o sistema vai validar se para a(s) rede(s) selecionada(s) já existe uma tabela ativa com a vigência (total ou parcial)
        E vai exibir uma crítica "Já existe uma tabela ativa que contempla o período de vigência informado"
            | Já existe uma tabela de pontuação para o período de vigência informado e para a(s) rede(s) abaixo:                     |
            | 'Rede Teste 1'                                                                                                         |
            | Verifique se existe a necessidade de subir uma nova tabela para este período e inative a anterior antes de prosseguir. |
        Quando o admin preencher a vigência de 30/12/2022 até 31/12/2022 com as mesmas Redes ou 31/12/2022 até 01/01/2023
        E acionar o botão "Enviar" novamente
        Então o sistema vai validar se para a(s) rede(s) selecionada(s) já existe uma tabela ativa com a vigência (total ou parcial)
        E vai exibir uma crítica "Já existe uma tabela ativa que contempla o período de vigência informado"
        E não faz o cadastro do arquivo
#62324 - Não está permitindo importação na mesma vigência com redes diferentes.
#não permitir tabelas com a mesma vigência para a mesma rede, seja inicio e fim igual ou parcial


@manual
@Tarefa_#:61014
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-importar-tabela-rede-com-outra-tabela-inativa-e-a-mesma-vigencia.mp4
    Cenário: Importar Tabela - Rede com outra tabela inativa e a msm vigência
        Dado que o admin acessou a tela de "Importar tabela"
        E preencheu um 'Título' único
        E uma vigência válida de "01/12/2022" até "31/12/2022"
        E selecionou as "Redes" 'A-1', 'A-2' e 'A-3'
        E a 'A-1' já possui uma tabela para essa vigência de "01/12/2022" até "31/12/2022"
        Mas a tabela dessa Rede está inativa
        E anexou um arquivo preenchido com dados válidos
        Quando acionar o botão "Enviar"
        Então o sistema vai validar se para a(s) rede(s) selecionada(s) já existe uma tabela Ativa
        Mas vai cadastrar essa tabela normalmente com status "Ativo", pois a tabela existente dessa Rede em comum está Inativa
        E vai exibir um modal/alerta de "Tabela cadastrada com sucesso"
        E redirecionar o admin de volta para a "Lista de Tabelas" #se for modal, ao clicar em Ok
        E exibirá a nova tabela na listagem da "Lista de Tabelas"



@manual
@Tarefa_#:61014
@manual-result:success
@manual-last-tested:19-10-2022
@manual-test-evidence:assets/A-importar-tabela-log-de-edicao-em-BD.png
    Cenário: Log de Edição em BD 
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos: