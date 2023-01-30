#language: pt

Funcionalidade: Banking - Home e Menus
Como usuário aministrador ativo na Plataforma
Quero acessar a Plataforma com Login e Senha
Para visualizar a Home

-----

Critérios de Aceitação:
Home é composta por cabeçalho, corpo e rodapé
No cabeçalho temos um "logo topo" na lateral esqueda que sobrepõe o Banners 
No cabeçalho temos um "menu" suspenso na lateral direita
No cabeçalho temos o "ícone de notificações" ao lado esquerdo do menu
No cabeçalho temos o "avatar do usuário" ao lado esquerdo do ícone de notificações, com dados do usuário à esquerda do avatar: "Nome do usuário", "ID do usuário" e "Pontuação do usuário"
No menu suspenso na lateral direita, contém os seguintes submenus: 
    - "Início";
    - "Bilbioteca";
    - "Campanhas";
    - "Catálogo de prêmios";
    - "Extrato de pontos";
    - "Meus Pedidos";
    - "Minha Conta" com as opções 'Editar meus dados' e 'Alterar senha'; 
    - "Notícias"; 
    - "Notificações"
    - "Treianemento";
    - "Regulamento"; 
    - "Sair"
No corpo da home temos: "carrossel de Banners";
    - "Seção Prêmios e Benefícios" com botão 'Ver catálogo completo'; 
    - "Seção de treinamentos com banner fixo" e botão 'Buscar treinamentos'; 
    - "Seção Canal de notícias" com botão 'Ver todas as notícias'.
No rodapé da home temos: 
    - "logo rodapé" que redireciona/recarrega a 'Home' 
    - "Mapa do site" com as opções 'Início' e 'Catálogo de prêmios'; 
    - "Minha conta" com as opções 'Meus pedidos', 'Extrato' e 'Meus dados'
    - "Atendimento" com a opção 'Regulamento' e 'Dúvidas' que é o FAQ

---


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Acessar, Layout e Sair
		Dado que o usuário fez login no banking
		E está na "Home Logada"
		Quando o usuário visualizar todos os elementos da tela
    	Então os elementos da tela estão alinhados corretamente
		Quando o admin acionar o menu do seu avatar na saudação "Olá, user teste"
		E acionar a opção "Sair"
		Então o sistema desloga o usuário
		E o redireciona para a "Home Deslogada" do banking


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Redirecionamentos nas Seções
        Dado que o usuário está na "Home Logada"
        Quando acionar os "<botão de cada sessão>" na home
        Então o sistema redireciona conforme "<redirecionamento>" 
        Exemplos:
            | <botão de cada sessão>  | <redirecionamento>                                                                        |
            | “Ver todas as notícias” | "Notícias" url > ".../Banking/News/index"                                                 |
            | “Ver catálogo completo” | "em teste não é configurado - só verificar menu com link, vai cair no extrato por padrão" |
            | “Buscar treinamentos”   | "Treinamentos" url > ".../Banking/Training/dashboard"                                     |



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Menus Superior e Redirecionamentos
		Dado que o usuário fez login no banking
		E está na "Home Logada"
        Quando acionar as "<opções do menu>" no menu superior lateral/principal
        Então o sistema redireciona o usuário para cada url conforme "<redirecionamento>"
        Quando o usuário clicar no logo 
        Então redireciona ou recarrega a "Home Logada"
        Exemplos:
            | <opções do menu>                | <redirecionamento>                                                                        |
            | Início                          | "Home Logada" url > ".../Banking/Home/dashboard"                                          |
            | Bilioteca                       | "Bilbioteca" url > ".../Banking/"                                                         |
            | Campanhas                       | "Campanhas" url > ".../Banking/"                                                          |
            | Catálogo de prêmios             | "em teste não é configurado - só verificar menu com link, vai cair no extrato por padrão" |
            | Extrato de Pontos               | "Extrato de Pontos" url "...Banking/Consumer/dashboard"                                   |
            | Meus  Pedidos                   | "Meus Pedidos" url > ".../Banking/Consumer/order"                                         |
            | Minha Conta > Editar meus dados | "Meus Dados" url > ".../Banking/Consumer/account"                                         |
            | Minha Conta > Alterar Senha     | "Senha e e-mail" url > ".../Banking/Consumer/password"                                    |
            | Notícias                        | "Notícias" url > ".../Banking/News/index"                                                 |
            | Notificações                    | "Notificações" url > ".../Banking/"                                                       |
            | Treianemento                    | "Treianemento" url > ".../Banking/"                                                       |
            | Regulamento                     | "Regulamento" url > ".../Banking/Consumer/terms"                                                        |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Banking - Redirecionamentos Rodapé
        Dado que o usuário fez login no banking
		E está na "Home Logada"
        Quando acionar as "<opções" do rodapé
        Então o sistema redireciona o usuário para cada url conforme "<redirecionamento>"
        Quando o usuário clicar no logo do rodapé
        Então redireciona ou recarrega a "Home Logada"
        Exemplos:
            | <opções>                                | <redirecionamento>                                                                        |
            | Logo > Início                           | "Home Logada" url > ".../Banking/Home/dashboard"                                          |
            | Mapa do Site > Início                   | "Home Logada" url > ".../Banking/Home/dashboard"                                          |
            | Mapa do Site > Catálogo de prêmios      | "em teste não é configurado - só verificar menu com link, vai cair no extrato por padrão" |
            | Minha conta > Meus pedidos              | "Meus Pedidos" url > ".../Banking/Consumer/order"                                         |
            | Minha conta > Extrato                   | "Extrato de Pontos" url "...Banking/Consumer/dashboard"                                   |
            | Minha conta > Meus Dados                | "Meus Dados" url > ".../Banking/Consumer/account"                                         |
            | Atendimento > Regulamento               | "Dúvidas" url > ".../Banking/Consumer/terms"                                                |
            | Atendimento > Dúvidas                   | "Dúvidas" url > ".../Banking/Consumer/faq"                                                |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: FAQ
        Dado que o usuário acessou a tela do FAQ através do menu "Dúvidas"
		Quando o usuário visualizar todos os elementos da tela
        E cada pergunta se expandir conforme clique na ">"
        E exibir mais perguntas com clicar no '+' ao final da tela
    	Então os elementos da tela estão alinhados corretamente


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: O Regulamento
        Dado que o usuário acessou a tela do 'Regulamento' através do menu "Regulamento"
        Quando o usuário visualizar os elementos da tela
        E navegar em todo o conteúdo do regulamento da campanha, podendo fazer download do arquivo
        Então os elementos da tela estão alinhados corretamente

#6 CN