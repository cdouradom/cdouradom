#language: pt

Funcionalidade: Notícias - Listagem e exclusão de Notícia
Como usuário admin desta campanha
Quero acessar a tela do módulo de Notícias
Para visualizar os Notícia existentes

-----

Critérios de aceitação:
Exibir breadcrumb
Disponibilizar botão "Cadastrar"
Exibir as seguintes colunas na listagem: "Título" e botão "Ações" com as opções 'Alterar' e 'Excluir'
Fazer paginação com 20 registros por página

---


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Notícia - Acesso, Layout e Abrir Ações
        Dado que o admin está logado na Plataforma da campanha
        Quando o admin acionar o menu principal "Gerencial"
        Então serão demonstrados os submenus disponíveis, entre eles: "Notícias"
        Quando o admin acionar o submenu "Notícias"
        Então o admin visualizar os elementos da tela abaixo
        | Breadcrumbs       | com redirecionamento ao clique             |
        | Qnt registros     | Foram encontrados 'x' registros            |
        | Botão "Cadastrar" | Com url da tela de cadastro                |
        | Gride - Títulos   | Título, Ações                              |
        | Gride - Listagem  | Título da Notícia, Ações: Alterar e Exluir |
        Quando acionar o botão "Ações"
        Então serão demonstradas as opções "Alterar" e "Excluir"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Notícia - Acionar opção Alterar
        Dado que o admin está na tela de "Notícias"
        E acionou o botão "Ações"
        Quando acionar a opção "Alterar" dentro de Ações
        Então o sistema redireciona o admin para a tela de "Edição" de url ".../Plataform/Notícia/add/***"
        E o ID desta Notícia será evidenciado no final da url "***" da tela

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Notícia - Acionar opção Excluir
        Dado que o admin está na tela de "Notícias"
        E acionou o botão "Ações"
        Quando acionar a opção "Excluir" dentro de Ações
        Então o sistema exibe o modal "Confirmar exclusão" para confirmação com os botões "Cancelar" e "Excluir"
        | Deseja realmente excluir esta notícia? |
        Quando o admin acionar o botão "Cancelar" no modal de "Confirmar exclusão"
        Então o sistema fecha o modal
        E o Notícia não é excluída
        Quando o admin acionar o botão "Confirmar" no modal de "Confirmar exclusão"
        Então o sistema recarrega a tela, exlui o Notícia da campanha
        E não lista mais o Notícia excluída
        E essa notícia é remodia da visualização do usuáiro final no banking


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
Cenário: Listagem de Notícia - Paginação e transição
    Dado que o admin esta na listagem de "Notícias"
    Quando a quantidade de registros ultrapassar 20 linhas
    Então deve-se gerar paginação
    Quando o admin acionar a transição de páginas
    Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros

#4 3CN