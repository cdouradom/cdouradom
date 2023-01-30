
Funcionalidade: Treinamentos - Cadastro e Edição

 Como administrador da campanha
 Quero fazer o cadastro e edição de treinamentos e módulos
 Para a utilização nos treinamento disponibilizados aos participantes no Banking

account_subcampaign_training
training_module
account_subcampaign_training_participant
training_module_execution

-----

Critérios de Aceitação:
Cada treinamento é composto por pelo menos um nome, imagem, status e um módulo
Cada treinamento precisa ter pelo menos um módulo configurado

---
@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastro - Acessar
    Dado que o admin esta logado
    Quando acessar o menu "Treinamentos"
    Então o submenu "Cadastrar" será exibido dentre as opções
    Quando o admin clicar no submenu "Cadastrar"
    Então o sistema redireciona para a tela "Cadastro de Treinamento"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Cadastro - Layout
        Dado que o admin esta logado
	    Quando o admin acessou a tela "Cadastro de Treinamento"
  	    Então os elementos abaixo serão exibidos
            | Breadcrumbs        | Com o Caminho para essa tela                                                  |
            | Título             | "Cadastro de Treinamentos"                                                    |
            | Região Dados       | Campos Nome, Descrição, Imagem, Status                                        |
            | Região Certificado | Check Box "Gerar Certificado", Botão "Clique aqui para selecionar um arquivo" |
            | Botões             | "Voltar", "Adicionar Módulo", "Salvar"                                        |



@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastro - Acessar e Cancelar
 	Dado que o admin esta logado
  	Quando acessar o menu "Treinamentos"
  	Então o submenu "Cadastrar" será exibido dentre as opções
  	Quando o admin clicar no submenu "Cadastrar"
   	Então o sistema redireciona para a tela "Cadastro de Treinamento"
   	E o admin clicar em "Voltar"
	Então o admin será redirecionado para tela "Treinamentos"


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Cenário: Treinamentos - Cadastrar - Voltar
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo
	Quando acionar o botão "Voltar"
	Então o sistema redireciona o admin para a tela "Treinamentos", interrompendo o cadastro


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
 Esquema do Cenário: Treinamentos - Cadastrar - Campos não preenchidos
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin não preencher o nome do treinanento
	E na região "Dados" o admin  não selecionar uma imagem
	E o admin não acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin  não preencher o nome
	E na região "Módulo" o admin  não preencher a descrição
	E na região "Módulo" o admin  não preencher o tipo
	Quando acionar o botão "Salvar"
	Então o sistema sinaliza campo a campo com as mensagens
	    Exemplos:	
            | NOME                              | Preencha este campo          |
            | IMAGEM                            | Selecione um arquivo         |
            | NÃO HABILITAR MÓDULO              | Adicione no mínimo um módulo |
            | NÃO PREENCHER NOME DO MÓDULO      | Preencha este campo          |
            | NÃO PREENCHER DESCRIÇÃO DO MÓDULO | Preencha este campo          |
            | NÃO PREENCHER TIPO DO MÓDULO      | Selecione uma opção          |


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Material de Leitura - Tipos arquivos inválidos
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Material de Leitura"
	E na região "Módulo" o admin selecionar um arquivo em formato diferente de PDF (ex: TXT, Imagem, XLSX, .Doc)
	Quando acionar o botão "Salvar"
	Então o sistema sinaliza o campo "Arquivo" com a mensagem "Tipo de arquivo inválido"


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Material de Leitura - Tipo arquivo válido - Apenas um módulo
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Material de Leitura"
	E na região "Módulo" o admin não selecionar nenhum arquivo
	Quando o admin acionar o botão "Salvar"
	Então o campo "Arquivo" exibirá o alerta "Selecione um arquivo"
	Quando o admin selecionar um arquivo em formato PDF
	Então será demonstrado o nome do arquivo no campo "Arquivo"
	Quando o admin acionar o botão "Salvar"
	Então o sistema exibirá o modal "Treinamento salvo com sucesso!"
	E o sistema redireciona o admin para a tela "Treinamentos"
	E o treinamento será demonstrado na listagem de treinamentos
	Quando o admin acionar o botão "Ações/Alterar" do treinamento
	Então todos os campos estarão preenchidos corretamente


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Material de Leitura - Tipo arquivo válido - Mais de um módulo
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Material de Leitura"
	E na região "Módulo" o admin selecionar um arquivo em formato PDF
	Então será demonstrado o nome do arquivo no campo "Arquivo"
	Quando o admin acionar novamente o botão "Adicionar Módulo"
	E na nova região "Módulo" o admin preencher o nome
	E na nova região "Módulo" o admin preencher a descrição
	E na nova região "Módulo" o admin preencher o tipo "Material de Leitura"
	E na nova região "Módulo" o admin selecionar outro arquivo em formato PDF
	Então será demonstrado o nome do arquivo no campo "Arquivo"
	Quando o admin acionar o botão "Salvar"
	Então o sistema exibirá o modal "Treinamento salvo com sucesso!"
	E o sistema redireciona o admin para a tela "Treinamentos"
	E o treinamento será demonstrado na listagem de treinamentos
	Quando o admin acionar o botão "Ações/Alterar" do treinamento
	Então todos os campos estarão preenchidos corretamente
	E os módulos de Material de Leitura estarão devidamente cadastrados


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Material de Leitura - Tipo arquivo válido - Trocar arquivo
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Material de Leitura"
	E na região "Módulo" o admin selecionar um arquivo em formato PDF
	Então será demonstrado o nome do arquivo no campo "Arquivo"
	Quando o admin acionar o botão de exclusão do arquivo (X) 
	Então o arquivo será excluído do módulo
	E o campo "Arquivo" será liberado para uma nova seleção de arquivo 
	Quando o admin selecionar um novo arquivo em formato PDF
	E acionar o botão "Salvar"
	Então o sistema exibirá o modal "Treinamento salvo com sucesso!"
	E o sistema redireciona o admin para a tela "Treinamentos"
	E o treinamento será demonstrado na listagem de treinamentos
	Quando o admin acionar o botão "Ações/Alterar" do treinamento
	Então todos os campos estarão preenchidos corretamente


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Vídeo - Link Inválido
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Vídeo"
	E na região "Módulo" o admin inserir um link inválido (diferente do youtube) no campo "Vídeo (Youtube)"
	Quando acionar o botão "Salvar"
	Então o sistema sinaliza o campo "Arquivo" com a mensagem "Link de Youtube Inválido"


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Vídeo - Link Válido - Apenas um módulo
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Vídeo"
	E na região "Módulo" o admin não digitar nenhum link no campo "Vídeo (Youtube)"
	Quando o admin acionar o botão "Salvar"
	Então o campo "Vídeo Youtube" exibirá o alerta "Preencha este campo"
	Quando o admin digitar um link válido do Youtube
	E acionar o botão "Salvar"
	Então o sistema exibirá o modal "Treinamento salvo com sucesso!"
	E o sistema redireciona o admin para a tela "Treinamentos"
	E o treinamento será demonstrado na listagem de treinamentos
	Quando o admin acionar o botão "Ações/Alterar" do treinamento
	Então todos os campos estarão preenchidos corretamente


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Vídeo - Link Válido - Mais de um módulo
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Vídeo"
	E na região "Módulo" o admin digitar um link válido do Youtube no campo "Vídeo (Youtube)"
	Quando o admin acionar novamente o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher outro nome
	E na região "Módulo" o admin preencher outra descrição
	E na região "Módulo" o admin preencher o tipo "Vídeo"
	E na região "Módulo" o admin digitar um novo link válido do Youtube no campo "Vídeo (Youtube)"
	Quando o admin acionar o botão "Salvar"
	Então o sistema exibirá o modal "Treinamento salvo com sucesso!"
	E o sistema redireciona o admin para a tela "Treinamentos"
	E o treinamento será demonstrado na listagem de treinamentos
	Quando o admin acionar o botão "Ações/Alterar" do treinamento
	Então todos os campos estarão preenchidos corretamente
	E os módulos de vídeo estarão devidamente cadastrados


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastro - Like no campo Quiz
    Dado que o admin está na tela para cadastro de "Treinamentos"
    Quando digitar no campo "Quiz" um parte de um nome existente nos quizzes para essa campanha
    Então o sistema busca apenas os quizzes que contém o termo digitado


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Quiz - Apenas um módulo
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Quiz"
	E na região "Módulo" o admin não selecionar nenhum quiz
	Quando o admin acionar o botão "Salvar"
	Então o campo "Quiz" exibirá o alerta "Selecione uma opção"
	Quando o admin selecionar um quiz
	Então será demonstrado o nome do quiz no campo "Quiz"
	Quando o admin acionar o botão "Salvar"
	Então o sistema exibirá o modal "Treinamento salvo com sucesso!"
	E o sistema redireciona o admin para a tela "Treinamentos"
	E o treinamento será demonstrado na listagem de treinamentos
	Quando o admin acionar o botão "Ações/Alterar" do treinamento
	Então todos os campos estarão preenchidos corretamente


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulo Quiz - Mais de um módulo
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Quiz"
	E na região "Módulo" o admin selecionar um quiz
	Então será demonstrado o nome do quiz no campo "Quiz"
	Quando o admin acionar novamente o botão "Adicionar Módulo"
	E na nova região "Módulo" o admin preencher o nome
	E na nova região "Módulo" o admin preencher a descrição
	E na nova região "Módulo" o admin preencher o tipo "Quiz"
	E na nova região "Módulo" o admin selecionar outro quiz
	Então será demonstrado o nome do novo quiz no campo "Quiz"
	Quando o admin acionar o botão "Salvar"
	Então o sistema exibirá o modal "Treinamento salvo com sucesso!"
	E o sistema redireciona o admin para a tela "Treinamentos"
	E o treinamento será demonstrado na listagem de treinamentos
	Quando o admin acionar o botão "Ações/Alterar" do treinamento
	Então todos os campos estarão preenchidos corretamente
	E os módulos de quiz estarão devidamente cadastrados


@manual
@tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastrar - Módulos Diferentes
	Dado que o admin acessou o menu "Treinamentos"
	Quando o admin clicar no submenu "Cadastrar"
	Então o sistema redireciona o admin para a tela "Cadastro de Treinamento"
	E na região "Dados" o admin preencher o nome do treinanento
	E na região "Dados" o admin preencher a descrição
	E na região "Dados" o admin selecionar uma imagem
	E na região "Dados" o admin preencher o status
	E na região "Certificado" o admin acionar o checkbox "Gerar Certificado"
	E na região "Certificado" o admin selecionar uma imagem para o certificado
	E o admin acionar o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher o nome
	E na região "Módulo" o admin preencher a descrição
	E na região "Módulo" o admin preencher o tipo "Material de Leitura"
	E na região "Módulo" o admin selecionar um arquivo em formato PDF
	Então será demonstrado o nome do arquivo no campo "Arquivo"
	Quando o admin acionar novamente o botão "Adicionar Módulo"
	E na região "Módulo" o admin preencher outro nome
	E na região "Módulo" o admin preencher outra descrição
	E na região "Módulo" o admin preencher o tipo "Vídeo"
	E na região "Módulo" o admin digitar um link válido do Youtube no campo "Vídeo (Youtube)"
	E o admin acionar novamente o botão "Adicionar Módulo"
	E na nova região "Módulo" o admin preencher o nome
	E na nova região "Módulo" o admin preencher a descrição
	E na nova região "Módulo" o admin preencher o tipo "Quiz"
	E na nova região "Módulo" o admin selecionar um quiz
	Então será demonstrado o nome do quiz no campo "Quiz"
	Quando o admin acionar o botão "Salvar"
	Então o sistema exibirá o modal "Treinamento salvo com sucesso!"
	E o sistema redireciona o admin para a tela "Treinamentos"
	E o treinamento será demonstrado na listagem de treinamentos
	Quando o admin acionar o botão "Ações/Alterar" do treinamento
	Então todos os campos estarão preenchidos corretamente
	E os módulos de Material de Leitura, Vídeo e Quiz estarão devidamente cadastrados


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Cadastro - Com status Inativo
    Dado que o admin está na tela para cadastro de "Treinamentos"
    E preencheu os campos obrigatórios com valores válidos
    Quando visualizar o campo "status", estará por padrão como "ativo"
    Mas o admin troca o status para "inativo"
    E ao acionar o botão "Salvar"
    Então um modal de "Sucesso" será exibido com a mensagem "Treinamento salvo com sucesso!" 
    Então o sistema cadastra este treinamento com status "Inativo"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Acessar 
    Dado que o admin está na listagem de treinamentos
    Quando existem treinamentos cadastrados para a campanha
    Então os treinamentos são exibidos na listagem
    E pode ser acessados através de clique no botão "Ações/Alterar"
    Então o sistema redireciona o admin para a tela de edição com todos os dados já preenchidos conforme cadastro
    E é acrescentado ao final da url o ID do respectivo treinamento /Plataform/Training/edit?id="*ID*"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Acessar ID de treinamento de outra campanha
    Dado que o admin clicou no botão "Ações/Alterar" de um treinamento exibido na listagem
    Quando o sistema abrir a tela de edição do respectivo ID de treinamento desta campanha
    E o admin alterar o ID na url para o ID do treinamento de outra campanha
    E acionar a tecla "Enter"
    Então o sistema redireciona o admin para a home, impedindo a alteração do treinamento de outra campanha


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Cancelar
    Dado que o admin acessou a edição de um "Treinamento" desta campanha
    Quando o admin acionar o botão "Cancelar"
    Então o sitema redireciona o admin de volta para a listagem de Treinamentos interrompendo a edição
    E não altera nenhuma informação


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Apagar informações obrigatórias
    Dado que o admin acessou a edição de um "Treinamento" desta campanha
    Quando remover as informações obrigatórias de "<Nome>", "<Descrição>", "<Imagem>", "<Nome (do(s) módulo(s))>", "<Descrição (do(s) módulo(s))>" e "<Arquivo (do(s) módulo(s))>"
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Atenção" com a "<Mensagem do sistema>" ou algo similar para cada campo obrigatório não preenchido
    E não altera nenhuma informação
    Então o admin poderá fechar o modal de atenção clicando no "X"
    E permanecerá na mesma tela
    Exemplos:
            | Campo                                            | Dado atual    | Dado novo | Resposta do sistema                        |
            | Nome                                             | Teste 1       |           | Preencha este campo                        |
            | Descrição                                        | Teste 2       |           | Selecione uma trilha para este treinamento |
            | Imagem                                           | Selecionada   |           | Selecione um arquivo                       |
            | Nome dos Módulos                                 | Teste 3       |           | Preencha este campo                        |
            | Descrição dos Módulos                            | Teste 4       |           | Preencha este campo                        |
            | Arquivo dos Módulos (quando Material de Leitura) | Selecionado   |           | Selecione um arquivo                       |
            | Vídeo (Youtube) (quando vídeo)                   | link válido   |           | Preencha este campo                        |
            | Quiz                                             | "da listagem" |           | Selecione uma opção                        |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Alterar informações obrigatórias
    Dado que o admin acessou a edição de um "Treinamento" desta campanha
    Quando alterar as informações obrigatórias de "<Nome>", "<Descrição>", "<Imagem>", "<Nome (do(s) módulo(s))>", "<Descrição (do(s) módulo(s))>" e "<Arquivo (do(s) módulo(s))>"
    E acionar o botão "Salvar"
    Então o sistema exibe o modal "Treinamento salvo com sucesso!"
    E o admin é redirecionado para a listagem de "Treinamentos"
    Quando o admin acionar o botão "Ações / Alterar" do respectivo treinamento
    Então os novos dados serão visalizados
    Exemplos:
            | Campo                                            | Dado atual    | Dado novo                | Resposta do sistema                  |
            | Nome                                             | Teste 1       | Nome novo                | Subscreve o nome do treinamento      |
            | Descrição                                        | Teste 2       | Descrição nova           | Subscreve a descrição do treinamento |
            | Imagem                                           | Selecionada   | Nova imagem              | Subscreve a imagem do treinamento    |
            | Nome dos Módulos                                 | Teste 3       | Nome novo do módulo      | Subscreve o nome do módulo           |
            | Descrição dos Módulos                            | Teste 4       | Descrição nova do módulo | Subscreve a descrição do módulo      |
            | Arquivo dos Módulos (quando Material de Leitura) | Selecionado   | Novo arquivo             | Subscreve o arquivo do módulo        |
            | Vídeo (Youtube) (quando vídeo)                   | link válido   | Novo Link                | Subscreve o link Youtube do módulo   |
            | Quiz                                             | "da listagem" | Outro da lista           | Subscreve o quiz do módulo           |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Alterar o status de ativo para inativo
    Dado que o admin acessou a edição de um Treinamento "Ativo" desta campanha
    Quando alterar o status para "Inativo"
    E acionar o botão "Salvar"
    Então o sistema exibe o modal "Treinamento salvo com sucesso!" 
    E o sistema altera o status deste treinamento para "Inativo"
    E na listagem de treinamentos este ID estará como Inativo e virá na busca por status inativo
    E remove da visualização dos participantes no banking


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Alterar o status de Inativo para Ativo
    Dado que o admin acessou a edição de um Treinamento "Inativo" desta campanha
    Quando alterar o status para "Ativo"
    E acionar o botão "Salvar"
    Então o sistema exibe o modal "Treinamento salvo com sucesso!" 
    E o sistema altera o status deste treinamento para "Ativo"
    E na listagem de treinamentos este ID estará como Ativo e virá na busca por status Ativo
    E é apresentado na visualização dos participantes no banking


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Cenário: Treinamentos - Edição - Visualizar imagem de treinamento 
    Dado que o admin acessou a edição de um "Treinamento" desta campanha
    E esse treinamento possui imagem cadastrada
    Quando o admin clicar no "olho" exibido ao lado do anexo
    Então o sistema abre uma nova aba do navegador e exibe a imagem que o admin cadastrou anteriormente


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets   
Cenário: Treinamentos - Edição - Alterar imagem do treinamento 
    Dado que o admin acessou a edição de um "Treinamento" desta campanha
    E esse treinamento possui imagem cadastrada
    Quando o admin clicar no "X" exibido ao lado do anexo
    Então o sistema remove o anexo/imagem
    E a descrição "Clique aqui para selecionar um arquivo" retorna
    Quando o admin acionar a opção "Clique aqui para selecionar um arquivo"
    E inserir uma imagem do explorador de arquivo
    Então o sistema insere a imagem selecionada
    E a opção "Clique aqui para selecionar um arquivo" atualiza para o <nome do arquivo>
    Então as duas opções passam a compor a parte da "Imagem do treinamento" novamente, um "olho" para visualização do arquivo ao clicar
    E um "X" para remover o arquivo
    Quando o admin acionar o botão "Salvar"
    Então o sistema exibe o modal "Treinamento salvo com sucesso!" 
    E o sistema atualiza a imagem do treinamento com a nova anexada/importada
    E exibirá essa nova imagem em todas as thumbs do treinamento na visão de admin e banking


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Remover Módulo - Único Módulo - Treinamento não executado
    Dado que o admin acessou a edição de um Treinamento ainda não executado
    Quando remover o único módulo configurado na campanha
    E acionar o botão "Salvar"
    Então o sistema exibe o modal "Adicione no mínimo um módulo" 
    E não ocorre a gravação até que haja pelo menos um módulo configurado


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Remover Módulo - Múltiplos Módulos - Treinamento não executado
    Dado que o admin acessou a edição de um Treinamento ainda não executado
    Quando remover um dos módulos que estão configurados na campanha
    E acionar o botão "Salvar"
    Então o sistema exibe o modal "Treinamento salvo com sucesso!" 


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Edição - Remover Módulo - Treinamento já executado
    Dado que o admin acessou a edição de um Treinamento que já foi executado pelo banking
    Quando tentar remover algum módulo
    Então não será possível excluir, pois a opção de exclusão estará desabilitada
        

@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Edição - Ver Módulo - Vídeo e Quiz
    Dado que o admin acessou a edição de um Treinamento
    Quando vizualizar os módulos de Vídeo e Quiz
    E acionar o botão "Ver" de cada um dos módulos
    Então o sistema exibe os seguintes comportamentos
    Exemplos: 
    |Tipo de Módulo|Comportamento                                                         |
    |Vídeo         |O sistema abre uma nova guia do navegador e executa o vídeo no Youtube|
    |Quiz          |O sistema abre uma nova guia do navegador com a edição do Quiz        |

