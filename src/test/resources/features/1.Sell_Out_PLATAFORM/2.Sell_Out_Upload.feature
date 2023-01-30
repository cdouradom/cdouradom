#language: pt

Funcionalidade: Upload de Importação de Vendas
Como usuário administrador ativo na Plataforma
Quero acessar a tela de cadastro de Importação de vendas
Para fazer upload de novos arquivos de vendas
E validar a estrutura necessária no upload do arquivo

    BD 
     SELECT * FROM `file_import` ORDER BY id DESC;
     SELECT * FROM `file_import_form` ORDER BY id DESC;   

-----

Critérios de Aceitação:
Acessado através do menu: Gerencial > Sell Out > Importação > Botão "Importar Vendas"
Exibir breadcrumb na tela para upload de arquivo
Exibir nome na seção / título na tela: "Importação de Sell Out"
Disponibilizar o botão "Download modelo" no canto superior direito da tela
Botão "Download modelo" deve baixar arquivo "Modelo de importação de vendas.xlsx"
Disponibilizar dois campos de preenchimento obrigatório: 
    - "Período" listagem com mês e ano concatenados
    - "Arquivo" para Upload do arquivo
Disponibilizar os botões "Voltar" e "Enviar"
Botão "Voltar" redireciona o admin de volta para a listagem de importações
Botão "Enviar" valida o preenchimento dos campos e o formato do arquivo no momento do upload conforme modelo
Botão "Enviar" exibe um loader na tela durante o Upload do arquivo, impedindo ações na tela durante o carregamento
Enviar resultando em sucesso salva o arquivo com o status "Aguardando processamento" e retornará para a listagem de importações
Ao salvar arquivo de vendas exibir modal de sucesso com a mensagem "Arquivo cadastrado com sucesso" om botão ok que fecha o modal #não é impedimento, podendo ser inserido como sugestão

---

@manual
@tarefa_#63668
@ajuste_#65231
@manual-result:success
@manual-last-tested:22-11-2022
@manual-test-evidence:assets/A-acessar-importacao-de-sell-out-baixar-modelo-e-voltar.mp4,assets/A-acessar-importacao-de-sell-baixar-modelo.png
    Cenário: Acessar Importação de Sell Out, baixar modelo e Voltar
        Dado que o admin está na listagem de "Importação de Vendas"
        Quando acionar o botão "Importar Vendas"
        Então o sistema direciona para a tela "Importação de Sell Out"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumb            | Sell Out / Importação                                |
            | Botão Download modelo | baixar arquivo "Modelo de importação de vendas.xlsx" |
            | Título                | Importação de Sell Out                               |
            | Período               | Mês/Ano de 2022 (iniciando a partir de 08/2022)      |
            | Arquivo               | Escolher Arquivo para Upload                         |
            | Botões                | Voltar / Enviar                                      |
        Quando o admin clicar em "Download modelo"
        Então o arquivo "Modelo de importação de vendas.xlsx" será baixado conforme modelo requerido em escopo
        Quando o admin acionar o botão "Voltar"
        Então o sistema redireciona o admin de volta para a listagem de importações
    #vericicar como validar regra de virada do ano : - tratativa para quando virar o ano;
	    #Exibir os três últimos meses do ano anterior caso esteja nos três primeiros meses do ano;
	    #Após os três primeiros meses exibir todos os meses do ano (exceto para 2022);
#65231 - Nome do arquivo está diferente


@manual
@tarefa_#63668
@ajuste_#65235
@manual-result:success
@manual-last-tested:22-11-2022
@manual-test-evidence:assets/A-acessar-importacao-de-sell-out-campos-vazios.png,assets/A-acessar-importacao-de-sell-out-campos-vazios-II.png,assets/A-acessar-importacao-de-sell-out-campos-vazios-III.png
    Cenário: Importação de Sell Out campos vazios
        Dado que o admin está na tela de "Importação de Sell Out"
        Quando acionar o botão "Enviar"
        Mas não selecionar um "Período"
        E não fizer upload de arquivo no campo "Selecionar Arquivo"
        Então o sistema exibe um alerta em ambos os campos "Selecione o Período" e "Selecione um arquivo"    
        E não faz o cadastro do arquivo
        E mantém o admin na tela de Upload pois ambos os campos são de preenchimento obrigatório
#65235 (sugestão) - Alertar "individualmente" os campos que estiverem vazios

@manual
@tarefa_#63668
@ajuste_#65254
@manual-result:success
@manual-last-tested:30-11-2022
@manual-test-evidence:assets/A-importacao-sell-out-com-arquivos-invalidos-TXT.mp4,assets/A-importacao-sell-out-com-arquivos-invalidos-ODS.mp4,assets/A-importacao-sell-out-com-arquivos-invalidos-XLT-processou-sem-critica.mp4,assets/A-importacao-sell-out-com-arquivos-invalidos-Titulo-Colunas-Diferentes.mp4,assets/A-importacao-sell-out-com-arquivos-invalidos-CABECALHO.mp4,assets/A-importacao-sell-out-com-arquivos-invalidos-COLUNA-A-MAIS.mp4,assets/A-VAZIO.mp4
    Cenário: Importação de Sell Out com arquivos inválidos
        Dado que o admin está na tela de "Importação de Sell Out"
        Quando acionar o select do "Período"
        E selecionar uma opção dentre as exibidas na lista suspensa
        Então ficará definido o Período
        Quando acionar o input "Selecionar Arquivo"
        E selecionar no explorador de arquivo um arquivo com extensão diferente de '.xlsx' como: xls, ods, xlt, csv
        E acionar o botão "Enviar"
        Então o sistema apresentará um loader na tela
        E retornará com a mensagem de arquivo inválido devido a extensão não ser conforme modelo esperado
        E não faz o cadastro do arquivo
        E mantém o admin na tela de Upload
        Quando o admin selecionar um Período na lista suspensa
        E inserir um arquivo de extensão .xlsx
        Mas o arquivo não seguir a estrutura conforme modelo, sendo "cabeçalho diferente", "título de alguma coluna alterado", "título de alguma coluna vazio", "coluna(s) a mais", "coluna(s) a menos", "arquivo sem cabeçalho sendo completamente vazio"
        E acionar o botão "Enviar"
        Então o sistema apresentará um loader na tela
        E retornará com a mensagem de arquivo inválido devido a estrutura não ser conforme modelo esperado
        E não faz o cadastro do arquivo
        E mantém o admin na tela de Upload
#Obs1: arquivo com extensão xlt não acarreta pendência, pois é um modelo do excel
#Obs2: nas importações de arquivos com extensão inválida, por padrão o sistema cadastra o arquivo, mas exibe a pendência.
#65254: Não está exibindo as pendências

@manual
@tarefa_#63668
@manual-result:success
@manual-last-tested:22-11-2022
@manual-test-evidence:assets/A-importacao-de-sell-out-com-arquivo-valido.mp4
    Cenário: Importação de Sell Out com arquivo válido
        Dado que o admin está na tela de "Importação de Sell Out"
        Quando acionar o select do "Período"
        E selecionar uma opção dentre as exibidas na lista suspensa
        Então ficará definido o Período para o arquivo
        Quando acionar o input "Selecionar Arquivo"
        E selecionar no explorador de arquivos um arquivo conforme o modelo baixado que contenha além do cabeçalho uma linha preenchida
        E acionar o botão "Enviar"
        Então o sistema apresentará um loader na tela durante a validação de estrutura do arquivo
        E cadastra o arquivo na campanha no status "Aguardando processamento"
        E apresentará um modal de sucesso com a mensagem "Arquivo cadastrado com sucesso"
        E redireciona o admin de volta para a listagem de importações
        E exibe na listagem este arquivo cadastrado no status "Aguardando processamento"
        Mas não exibe ainda o botão "Detalhes", até que a cron de processamento seja processada
#Obs1: Seguindo o padrão da Fischer, não é apresentado o modal "Arquivo cadastrado com sucesso" ao importar o arquivo.

#4 CN