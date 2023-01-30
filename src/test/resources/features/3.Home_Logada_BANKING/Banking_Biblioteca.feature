#language: pt

Funcionalidade: Banking Biblioteca

-----

Critérios de Aceitação:
Como usuário do banking
Quero acessar o cadastro de bibliotecas
Para assistir videos e/ou ouvir os áudios e/ou fazer download dos materiais da biblioteca configurada pelo admin
---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Cenário: Banking Biblioteca - Acesso 
    Dado que o usuário está logado no banking
    Quando acionar o menu > Biblioteca
    Então será direcionado para a página "Biblioteca"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Esquema do Cenário: Banking Biblioteca - Layout
    Dado que o usuário está logado no banking
    E acionou o menu > Biblioteca
    Então ocorre o direcionamento para a página "Biblioteca"
    E os elementos da tela estão alinhados corretamente
            | Título           | Treinamentos                                                                     |
            | Região "Filtros" | Campos "Nome", "Tipo" (Vídeo Youtube, Outros, Áudio, Material de Leitura, Vídeo) |
            | Thumbs           | Thumbs das bibliotecas                                                           |
            | Rodapé           | Texto informativo: Foram encontrados (X) resultados                              |
            | Rodapé           | Paginação                                                                        |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Esquema do Cenário: Banking Biblioteca - Filtros
    Dado que o usuário está logado no banking
    E acionou o menu > Biblioteca
    Então ocorre o direcionamento para a página "Biblioteca"
    Quando aplicar os filtros "Nome" e "Tipo"
    Então o sistema retorna o "<Resultado do Sistema>"
            | <Nome>    | <Tipo>   | <Resultado do sistema>                                                                                                                                                                                               |
            | Vazio     | Vazio    | Retorna todas as bibliotecas que estão configuradas no Admin sem as flags "Usar em Treinamento" ou "Usar em Campanha"                                                                                                |
            | Existente | Vazio    | Retorna todas as bibliotecas que estão configuradas no Admin sem as flags "Usar em Treinamento" ou "Usar em Campanha" e que possuem em seus nomes o termo inserido na pesquisa                                       |
            | Vazio     | Da lista | Retorna todas as bibliotecas que estão configuradas no Admin sem as flags "Usar em Treinamento" ou "Usar em Campanha" e do tipo selecionado                                                                          |
            | Existente | Da lista | Retorna todas as bibliotecas que estão configuradas no Admin sem as flags "Usar em Treinamento" ou "Usar em Campanha" e que possuem em seus nomes o termo inserido na pesquisa e que sejam do mesmo tipo selecionado |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Esquema do Cenário: Banking Bibliotecas - Execução - Vídeo (Youtube)
    Dado que o usuário está logado no banking
    Quando acionou o menu > Biblioteca
    Então ocorre o direcionamento para a página "Biblioteca"
    E o usuário vizualiza as bibliotecas disponíveis
    E há bibliotecas dos tipos "Vídeo (Youtube)", "Outros", "Áudio", "Material de Leitura" e "Vídeo"
    Quando o usuário filtrar as bibliotecas do tipo "Vídeo (Youtube)"
    E acionar a opção "Assistir" em uma das bibliotecas 
    Então é exibido o modal "Vídeo" contendo o vídeo do Youtube
    Quando o usuário acionar o botão "Play" do modal
    Então o vídeo será executado


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Esquema do Cenário: Banking Bibliotecas - Execução - Outros
    Dado que o usuário está logado no banking
    Quando acionou o menu > Biblioteca
    Então ocorre o direcionamento para a página "Biblioteca"
    E o usuário vizualiza as bibliotecas disponíveis
    E há bibliotecas dos tipos "Vídeo (Youtube)", "Outros", "Áudio", "Material de Leitura" e "Vídeo"
    Quando o usuário filtrar as bibliotecas do tipo "Outros"
    E acionar a opção "Download" em uma das bibliotecas 
    Então é aberto o explorador de arquiovos para salvar o arquivo
    Quando o usuário selecionar o diretório e salvar
    Então o arquivo será salvo no diretório escolhido
    E poderá ser executado pelo usuário


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Esquema do Cenário: Banking Bibliotecas - Execução - Áudio
    Dado que o usuário está logado no banking
    Quando acionou o menu > Biblioteca
    Então ocorre o direcionamento para a página "Biblioteca"
    E o usuário vizualiza as bibliotecas disponíveis
    E há bibliotecas dos tipos "Vídeo (Youtube)", "Outros", "Áudio", "Material de Leitura" e "Vídeo"
    Quando o usuário filtrar as bibliotecas do tipo "Áudio"
    E acionar a opção "Ouvir" em uma das bibliotecas 
    Então é exibido um modal para a execução do áudio
    Quando o usuário acionar o botão "Play" do modal
    Então o áudio será executado


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Esquema do Cenário: Banking Bibliotecas - Execução - Material de Leitura
    Dado que o usuário está logado no banking
    Quando acionou o menu > Biblioteca
    Então ocorre o direcionamento para a página "Biblioteca"
    E o usuário vizualiza as bibliotecas disponíveis
    E há bibliotecas dos tipos "Vídeo (Youtube)", "Outros", "Áudio", "Material de Leitura" e "Vídeo"
    Quando o usuário filtrar as bibliotecas do tipo "Material de Leitura"
    E acionar a opção "Download" em uma das bibliotecas 
    Então é aberto o explorador de arquiovos para salvar o arquivo
    Quando o usuário selecionar o diretório e salvar
    Então o arquivo será salvo no diretório escolhido
    E poderá ser executado pelo usuário   


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets
Esquema do Cenário: Banking Bibliotecas - Execução - Vídeo
    Dado que o usuário está logado no banking
    Quando acionou o menu > Biblioteca
    Então ocorre o direcionamento para a página "Biblioteca"
    E o usuário vizualiza as bibliotecas disponíveis
    E há bibliotecas dos tipos "Vídeo (Youtube)", "Outros", "Áudio", "Material de Leitura" e "Vídeo"
    Quando o usuário filtrar as bibliotecas do tipo "Vídeo"
    E acionar a opção "Assistir" em uma das bibliotecas 
    Então é exibido o modal "Vídeo" contendo o vídeo
    Quando o usuário acionar o botão "Play" do modal
    Então o vídeo será executado