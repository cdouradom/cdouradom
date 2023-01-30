#language: pt

Funcionalidade: Admin - Listagem e exclusão de Banner
Como usuário admin desta campanha
Quero acessar a tela do módulo de Banners
Para visualizar os banner existentes

-----

Critérios de aceitação:
Exibir breadcrumb
Exibir as seguintes colunas: "Imagem banner Desktop", "Imagem banner Mobile", "Data Final", "Título" e botão "Ações" com as opções 'Alterar' e 'Excluir'
Disponibilizar botão "Cadastrar"
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme novos cadastros: "Foram encontrados xxx registros"
Fazer paginação com 20 registros por página

---

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_acesso.png)
    Cenário: Listagem de Banner - Acesso
        Dado que o admin está logado na Plataforma da campanha
        Quando o admin acionar o menu principal
        E acionar o menu "Gerencial"
        Então serão demonstrados os submenus disponíveis, entre eles: "Banners"
        Quando o admin acionar o submenu "Banners"
        Então o sistema redireciona o admin para a url ".../Plataform/Banner/index", sendo a listagem de banner


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:
@manual-test-evidence:[Evidência](assets/A_Banner_layout.png)
    Cenário: Listagem de Banner - Layout
        Dado que o admin acessou o submenu "Banners"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        | Breadcrumbs       | com redirecionamento ao clique                                  |
        | Qnt registros     | Foram encontrados 'x' registros                                 |
        | Botão "Cadastrar" | Com url da tela de cadastro                                     |
        | Gride - Títulos   | Imagem banner Desktop, Imagem banner Mobile, Data Final, Título |
        | Gride - Listagem  | Informações respectivas ao cabeçalho, Ações: Alterar e Exluir   |


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_ações.png)
    Cenário: Listagem de Banner - Abrir Ações
        Dado que o admin está na tela de "Banners"
        E existe um banner na listagem
        Quando acionar o botão "Ações"
        Então serão demonstradas as opções "Alterar" e "Excluir"


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_cancelar.mp4)
    Cenário: Listagem de Banner - Acionar opção Alterar
        Dado que o admin está na tela de "Banners"
        E acionou o botão "Ações"
        Quando acionar a opção "Alterar" dentro de Ações
        Então o sistema redireciona o admin para a tela de "Edição" de url ".../Plataform/Banner/add/***"
        E o ID deste banner será evidenciado no final da url "***" da tela


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_excluir.webm)
    Cenário: Listagem de Banner - Ação Excluir
        Dado que o admin está na tela de "Banners"
        E acionou o botão "Ações"
        Quando acionar a opção "Excluir" dentro de Ações
        Então o sistema exibe o modal "Exclusão de banner" para confirmação com os botões "Cancelar" e "Excluir"
        | Tem certeza que deseja excluir este banner? |
        Quando o admin acionar o botão "Cancelar" no modal para confirmação da "Exclusão de banner"
        Então o sistema fecha o modal
        E o banner não é excluído
        Quando o admin acionar o botão "Confirmar" no modal para confirmação da "Exclusão de banner"
        Então o sistema recarrega a tela, exlui o banner da campanha
        E remove da listagem
        E não lista mais o banner excluído


#5 CN