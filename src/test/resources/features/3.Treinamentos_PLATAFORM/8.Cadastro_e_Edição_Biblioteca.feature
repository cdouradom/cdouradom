#language: pt

Funcionalidade: Cadastro e Edição de Biblioteca
 Como administrador da campanha
 Quero acessar o cadastro de bibliotecas
 Para cadastrar e editar as bibliotecas que poderam ser usadas pelo acesso direto à biblioteca no banking, pelas campanhas ou pelos treinamentos

library_item

------

Critérios de Aceitação:

---

@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Cadastro - Acessar
    Dado que o admin esta logado
    Quando acessar o menu "Treinamentos"
    Então o submenu "Biblioteca" será exibido dentre as opções
    Quando o admin clicar no submenu "Biblioteca"
    Então o sistema redireciona para a tela "Biblioteca"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Biblioteca - Cadastro - Layout
        Dado que o admin esta logado
	    Quando o admin acessou a tela "Biblioteca"
        E acionou o botão "Cadastrar"
        Então o admin será direcionado para a tela "Cadastrar"
  	    E os elementos abaixo serão exibidos
            | Breadcrumbs                | Com o Caminho para a tela                                                                                                                                                                                                                                          |
            | Título                     | "CADASTRAR"                                                                                                                                                                                                                                                        |
            | Região "Dados"             | Campos "Nome", "Tipo"                                                                                                                                                                                                                                              |
            | Região "Usar o arquivo em" | Flags "Usar em Treinamento" e "Usar em Campanha" / Campos "Treinamento" e "Campanha"                                                                                                                                                                               |
            | Rodapé                     | Texto informativo: "Ao Selecionar as opções de "Usar em treinamento" ou "Usar em campanha", o material ficará disponível apenas nestes módulos. Caso nenhuma destas opções esteja selecionada, o material ficará disponível na Biblioteca para todos os usuários." |
            | Botões                     | Cancelar e Salvar                                                                                                                                                                                              |

@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Cadastrar e Cancelar
    Dado que o admin esta logado
    Quando acessar o menu "Treinamentos"
    Então o submenu "Biblioteca" será exibido dentre as opções
    Quando o admin clicar no submenu "Biblioteca"
	Então o admin será redirecionado para tela "Treinamentos"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"
    Quando acionar o botão "Cancelar"
    Então o admin será redirecionado para a tela "Biblioteca"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Biblioteca - Cadastrar - Campos não preenchidos
    Dado que o admin esta na tela "Biblioteca"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"
    E na região "Dados" o admin não preencher o "Nome"
    E na região "Dados" o admin não preencher o "Tipo"
    E na região "Dados" o admin não preencher o "Link Youtube/Arquivo/Arquivo de Áudio/Arquivo para Leitura/Arquivo de Vídeo"
    E na região "Usar o Arquivo em" o admin acionar a opção "Usar em treinamento" e não selecionar nenhum treinamento ou acionar a opção "Usar em Campanha" e não selecionar nenhuma campanha
    Quando acionar o botão "Salvar"
	Então o sistema sinaliza campo a campo com as mensagens
	    Exemplos:	
            | NOME                                                                        | Preencha este campo                      |
            | TIPO                                                                        | Este campo é obrigatório                 |
            | Link Youtube/Arquivo/Arquivo de Áudio/Arquivo para Leitura/Arquivo de Vídeo | Preencha este campo/Selecione um arquivo |
            | Sem Treinamento selecionado                                                 | Selecione uma opção                      |
            | Sem Campanha selecionado                                                    | Selecione uma opção                      |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Cadastrar - Usar em Treinamento
    Dado que o admin está na tela "Biblioteca"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"
    E na região "Dados" o admin preencher o "Nome"
    E na região "Dados" o admin preencher o "Tipo"
    E na região "Usar o arquivo em" o admin acionar a opção "Usar em Treinamento"
    E selecionar um treinamento no campo "Treinamento"
    Então na região "Usar o arquivo em" a opção "Usar em Campanha" e o campo "Campanha" estarão desabilitados
    Quando o admin acionar o botão "Salvar"
    Então será exibido o modal de sucesso "Item adicionado a biblioteca."
    E o admin será redirecionado para a tela "Biblioteca"
    Quando o admin acionar o botão "Ações/Editar" do referido registro de biblioteca
    Então os campos continuam preenchidos corretamente


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Cadastrar - Usar em Campanha
    Dado que o admin está na tela "Biblioteca"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"
    E na região "Dados" o admin preencher o "Nome"
    E na região "Dados" o admin preencher o "Tipo"
    E na região "Usar o arquivo em" o admin acionar a opção "Usar em Campanha"
    E selecionar uma campanha no campo "Campanha"
    Então na região "Usar o arquivo em" a opção "Usar em Treinamento" e o campo "Treinamento" estarão desabilitados
    Quando o admin acionar o botão "Salvar"
    Então será exibido o modal de sucesso "Item adicionado a biblioteca."
    E o admin será redirecionado para a tela "Biblioteca"
    Quando o admin acionar o botão "Ações/Editar" do referido registro de biblioteca
    Então os campos continuam preenchidos corretamente 


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Cadastrar - Sem Segmentação
    Dado que o admin está na tela "Biblioteca"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"
    E na região "Dados" o admin preencher o "Nome"
    E na região "Dados" o admin preencher o "Tipo"
    E na região "Usar o arquivo em" o admin não acionar nenhuma opção (Usar em Treinamento/Usar em Campanha)
    Quando o admin acionar o botão "Salvar"
    Então será exibido o modal de sucesso "Item adicionado a biblioteca."
    E o admin será redirecionado para a tela "Biblioteca"
    Quando o admin acionar o botão "Ações/Editar" do referido registro de biblioteca
    Então os campos continuam preenchidos corretamente 


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Cadastrar - Like no campo Treinamento
    Dado que o admin está na tela para cadastro de "Biblioteca"
    Quando digitar no campo "Treinamento" uma parte de um nome existente nos treinamento para essa campanha
    Então o sistema busca apenas os treinamentos que contém o termo digitado      


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Cadastrar - Like no campo Campanha
    Dado que o admin está na tela para cadastro de "Biblioteca"
    Quando digitar no campo "Campanha" uma parte de um nome de campanha existente
    Então o sistema busca apenas as campanhas que contém o termo digitado


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Usar em Treinamento - Reflexo no Banking
    Dado que o admin está na tela "Biblioteca"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"
    E na região "Dados" o admin preencher o "Nome"
    E na região "Dados" o admin preencher o "Tipo"
    E na região "Usar o arquivo em" o admin acionar a opção "Usar em Treinamento"
    E selecionar um treinamento no campo "Treinamento"
    Então na região "Usar o arquivo em" a opção "Usar em Campanha" e o campo "Campanha" estarão desabilitados
    Quando o admin acionar o botão "Salvar"
    Então será exibido o modal de sucesso "Item adicionado a biblioteca."
    E o admin será redirecionado para a tela "Biblioteca"
    Quando o usuário do banking acessar o Menu "Treinamentos"
    Então será direcionado para a tela "Treinamentos"
    E ao acionar o botão "Entrar" do referido treinamento
    Então o usuário do banking será direcionado à tela da trilha de execução do treinamento
    Quando acionar o ícone de algum Módulo
    Então será direcionado à tela de execução do Módulo
    E ao acionar o botão "Material de Apoio"
    Então serão exibidos os ícones das bibliotecas configuradas para este treinamento


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Usar em Campanha - Reflexo no Banking
    Dado que o admin está na tela "Biblioteca"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"
    E na região "Dados" o admin preencher o "Nome"
    E na região "Dados" o admin preencher o "Tipo"
    E na região "Usar o arquivo em" o admin acionar a opção "Usar em Campanha"
    E selecionar uma campanha no campo "Campanha"
    Então na região "Usar o arquivo em" a opção "Usar em Treinamento" e o campo "Treinamento" estarão desabilitados
    Quando o admin acionar o botão "Salvar"
    Então será exibido o modal de sucesso "Item adicionado a biblioteca."
    E o admin será redirecionado para a tela "Biblioteca"
    Quando o usuário do banking acessar o Menu "Campanha"
    Então será direcionado para a tela "Campanhas"
    E ao clicar sobre o ícone da referida campanha
    Então o usuário do banking será direcionado à tela da campanha
    E ao acionar o botão "Material de Apoio"
    Então serão exibidos os ícones das bibliotecas configuradas para este treinamento


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Sem segmentação - Reflexo no Banking
    Dado que o admin está na tela "Biblioteca"
    Quando acionar o botão "Cadastrar"
    Então o admin será direcionado para a tela "Cadastrar"
    E na região "Dados" o admin preencher o "Nome"
    E na região "Dados" o admin preencher o "Tipo"
    E na região "Usar o arquivo em" não selecionar nenhuma segmentação (Usar em Treinamento/Usar em Campanha)
    Quando o admin acionar o botão "Salvar"
    Então será exibido o modal de sucesso "Item adicionado a biblioteca."
    E o admin será redirecionado para a tela "Biblioteca"
    Quando o usuário do banking acessar a Home 
    Então será disponilizado o item "Biblioteca" na Home do banking
    E será demonstrada a referida biblioteca recém cadastrada
    Quando o usuário do banking acessar o menu "Campanhas"
    Então a referida biblioteca recém cadastrada não será exibida em nenhuma campanha
    Quando o usuário do banking acessar o menu "Treinamentos"
    Então a referida biblioteca recém cadastrada não será exibida em nenhum treinamento   


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Edição - Acessar 
    Dado que o admin está na listagem de biblioteca
    Quando existem reistros de bibliotecas cadastrados
    Então os treinamentos são exibidos na listagem
    E pode ser acessados através de clique no botão "Ações/Editar"
    Então o sistema redireciona o admin para a tela de edição com todos os dados já preenchidos conforme cadastro
    E é acrescentado ao final da url o ID da respectiva biblioteca /Plataform/Library/edit?item_id="*ID*"


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Edição - Acessar ID de treinamento de outra campanha
    Dado que o admin clicou no botão "Ações/Editar" de uma biblioteca exibida na listagem
    Quando o sistema abrir a tela de edição do respectivo ID desta biblioteca
    E o admin alterar o ID na url para o ID de uma biblioteca de outra campanha
    E acionar a tecla "Enter"
    Então o sistema redireciona o admin para a home, impedindo a alteração do treinamento de outra campanha


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Cenário: Treinamentos - Biblioteca - Edição - Cancelar
    Dado que o admin acessou a edição de uma biblioteca desta campanha
    Quando o admin acionar o botão "Cancelar"
    Então o sitema redireciona o admin de volta para a listagem de bibliotecas interrompendo a edição
    E não altera nenhuma informação


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Biblioteca - Cadastrar - Campos não preenchidos
    Dado que o admin esta na tela "Biblioteca"
    Quando acionar o botão "Ações/Editar" de um determinado registro de biblioteca
    Então o admin será direcionado para a tela "Edição de item"
    E na região "Dados" o admin apagar o "Nome"
    E na região "Dados" o admin apagar o "Tipo"
    E na região "Dados" o admin apagar o "Link Youtube/Arquivo/Arquivo de Áudio/Arquivo para Leitura/Arquivo de Vídeo"
    E na região "Usar o Arquivo em" o admin acionar a opção "Usar em treinamento" e não selecionar nenhum treinamento ou acionar a opção "Usar em Campanha" e não selecionar nenhuma campanha
    Quando acionar o botão "Salvar"
	Então o sistema sinaliza campo a campo com as mensagens
	    Exemplos:	
            | NOME                                                                        | Preencha este campo                      |
            | TIPO                                                                        | Este campo é obrigatório                 |
            | Link Youtube/Arquivo/Arquivo de Áudio/Arquivo para Leitura/Arquivo de Vídeo | Preencha este campo/Selecione um arquivo |
            | Sem Treinamento selecionado                                                 | Selecione uma opção                      |
            | Sem Campanha selecionada                                                    | Selecione uma opção                      |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Biblioteca - Edição - Alterar informações obrigatórias
    Dado que o admin acessou a edição de uma biblioteca desta campanha
    Quando alterar as informações obrigatórias de "<Nome>", "<Tipo>", "<Link Youtube/Arquivo/Arquivo de Áudio/Arquivo para Leitura/Arquivo de Vídeo>", "<Treinamento>"e "<Campanha>"
    E acionar o botão "Salvar"
    Então o sistema exibe o modal "Item atualizado com sucesso."
    E o admin é redirecionado para a listagem de "Biblioteca"
    Quando o admin acionar o botão "Ações/Editar" da respectiva biblioteca
    Então os novos dados serão visalizados
    Exemplos:
            | CAMPO        | DADO ATUAL       | DADO NOVO        | RESPOSTA DO SISTEMA       |
            | NOME         | Teste 1          | Teste 2          | Mantém o nome "Teste 2"   |
            | TIPO         | "X" da lista     | "Y" da lista     | Mantém o tipo "Y"         |
            | Link/Arquivo | Link/arquivo "X" | Link/arquivo "Y" | Mantém o Link/arquivo "Y" |
            | Treinamento  | "X" da lista     | "Y" da lista     | Mantém o treinamento "Y"  |
            | Campanha     | "X" da lista     | "Y" da lista     | Mantém a campanha "Y"     |


@manual
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
Esquema do Cenário: Treinamentos - Biblioteca - Edição - Retirar Segmentação de uso em Treinamento/Campanha
    Dado que o admin acessou a edição de uma ou mais bibliotecas desta campanha
    Quando retirar a segmentação de "Usar em Treinamento>" ou "<Usar em Campanha>"
    E acionar o botão "Salvar"
    Então o sistema exibe o modal "Item atualizado com sucesso."
    E o admin é redirecionado para a listagem de "Biblioteca"
    Quando o admin acionar o botão "Ações/Editar" da respectiva biblioteca
    Então os novos dados serão visalizados
    Exemplos:
            | CAMPO               | DADO ATUAL   | DADO NOVO       | RESPOSTA DO SISTEMA      |
            | Usar em Treinamento | Botão ligado | Botão desligado | Mantém o botão desligado |
            | Treinamento         | "X" da lista | Vazio           | Mantém Vazio             |
            | Usar em Campanha    | Botão ligado | Botão desligado | Mantém o botão desligado |
            | Campanha            | "X" da lista | Vazio           | Mantém Vazio             |

