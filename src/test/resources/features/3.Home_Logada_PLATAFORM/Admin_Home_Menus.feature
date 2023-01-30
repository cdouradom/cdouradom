#language: pt

Funcionalidade: Admin - Home e Menus
Como usuário admin aministrador ativo na Plataforma
Quero acessar a Plataforma com Login e Senha
Para visualizar a Home


Critérios de Aceitação:
O dashboard deve ser apresentado na home
O dashboar deve demonstrar as seguintes informações: "Usuários Ativos", "Novos Usuários", "Pontos Distribuídos", "Usuários por status", "Acessos por dia", "Pedido por dia" e "Novos cadastros por mês"
No lado superior deve existir o menu principal, contendo os seguintes elementos: "Início", "Gerencial", "Relatórios" e "Treinamentos"
No menu "Gerencial" conter os seguintes submenus: "+Dashboard", "Área Segura", "Administradores", "Banners", "Usuários", "Campanhas" , "Notificações", "Notícias" e "Pop Up"
No menu "Relatórios" conter os seguintes submenus: "Acessos", "Aceite de Termos", "Pedidos", "Pontos distribuídos" e "Relatórios Personalizados"
No menu "Treinamentos" conter os seguintes submenus: "Quiz", "Cadastrar", "Listagem", "Aprovação de Pontos", "Relatório de Treinamentos" e "Biblioteca"
No lado superior direito exibir a saudação "Olá,xxxxx", com o avatar do usuário admin ao lado da saudação e um menu com as opções: "Alterar Senha" e "Sair"

---

@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Admin - Acessar, Layout e Sair
		Dado que o usuário admin fez login na Plataforma
		E está na "Home Logada"
		Quando o usuário admin visualizar todos os elementos da tela
    	Então os elementos da tela estão alinhados corretamente
		Quando o admin acionar o menu do seu avatar na saudação "Olá, admin teste"
		E acionar a opção "Sair"
		Então o sistema desloga o Admim
		E o redireciona para a "Home Deslogada"


@manual
@Tarefa_#:
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Home Admin - Homa dashboard e Menus
		Dado que o usuário admin fez login na Plataforma
		Quando a Home da Plataforma
		Então deverá conter os seguintes elementos no dashboard: "Usuários Ativos", "Novos Usuários", "Pontos Distribuídos", "Usuários por status", "Acessos por dia", "Pedido por dia" e "Novos cadastros por mês"
		E no menu principal: "Início", "Gerencial", "Relatórios" e "Treinamentos"
		Quando acionar a opção "Início"
		Então ocorre direcionamento para a Home da Plataforma 
		Quando acionar o menu "Gerencial"
		Então serão demonstrados os seguintes submenus: "+Dashboard", "Área Segura", "Administradores", "Banners", "Usuários", "Campanhas" , "Notificações", "Notícias" e "Pop Up"
		Quando acionar o menu "Relatórios"
		Então serão demonstrados os seguintes submenus: "Acessos", "Aceite de Termos", "Pedidos", "Pontos distribuídos" e "Relatórios Personalizados"
		Quando acionar o menu "Treinamentos"
		Então serão demonstrados os seguintes submenus: "Quiz", "Cadastrar", "Listagem", "Aprovação de Pontos", "Relatório de Treinamentos" e "Biblioteca"
		Quando clicar sobre as informações do lado superior direito no avatar
		Então será exibido o menu com as opções "Alterar Senha" e "Sair"


#2 CN