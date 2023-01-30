#language: pt

Funcionalidade: Admin - Listagem e exclusão de Banner
Como usuário admin desta campanha
Quero acessar a tela do módulo de Banners
Para visualizar os banner existentes

-----

Critérios de aceitação:
Exibir breadcrumb
Exibir as seguintes colunas: "Imagem banner Desktop", "Imagem banner Mobile", "Vigência", "Título" e botão "Ações" com as opções 'Alterar' e 'Excluir'
Disponibilizar botão "Ordenação na Home" e "Cadastrar"
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme novos cadastros: "Foram encontrados xxx registros"
Fazer paginação com 20 registros por página

---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Banner - Acesso
        Dado que o admin está logado na Plataforma da campanha
        Quando o admin acionar o menu principal
        E acionar o menu "Gerencial"
        Então serão demonstrados os submenus disponíveis, entre eles: "Banners"
        Quando o admin acionar o submenu "Banners"
        Então o sistema redireciona o admin para a url ".../Plataform/Banner/index", sendo a listagem de banner


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Banner - Layout
        Dado que o admin acessou o submenu "Banners"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        | Breadcrumbs               | com redirecionamento ao clique                                  |
        | Botão "Ordenação na Home" | Com url da tela de ordenação                                    |
        | Botão "Cadastrar"         | Com url da tela de cadastro                                     |
        | Gride - Títulos           | Imagem banner Desktop, Imagem banner Mobile, Vigência, Título |
        | Gride - Listagem          | Informações respectivas ao cabeçalho, Ações: Alterar e Exluir   |
        | Qnt registros             | Foram encontrados 'x' registros                                 |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Banner - Abrir Ações
        Dado que o admin está na tela de "Banners"
        E existe um banner na listagem
        Quando acionar o botão "Ações"
        Então serão demonstradas as opções "Alterar" e "Excluir"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Banner - Acionar opção Alterar
        Dado que o admin está na tela de "Banners"
        E acionou o botão "Ações"
        Quando acionar a opção "Alterar" dentro de Ações
        Então o sistema redireciona o admin para a tela de "Edição" de url ".../Plataform/Banner/add/***"
        E o ID deste banner será evidenciado no final da url "***" da tela


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Banner - Ação Excluir
        Dado que o admin está na tela de "Banners"
        E acionou o botão "Ações"
        Quando acionar a opção "Excluir" dentro de Ações
        Então o sistema recarrega a tela
        E exibe um modal de sucesso com a frase "Banner deletado com sucesso!"
        E o sistema , exclui o banner da campanha
        E remove da listagem
        E não lista mais o banner excluído

#5 CN