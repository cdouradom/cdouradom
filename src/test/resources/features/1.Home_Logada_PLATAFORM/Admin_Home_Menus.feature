#language: pt

Funcionalidade: Admin - Home e Menus
Como usuário admin aministrador ativo na Plataforma
Quero acessar a Plataforma com Login e Senha
Para visualizar a Home


Critérios de Aceitação:
O dashboard deve ser apresentado na home
O dashboar deve demonstrar as seguintes informações: "usuário admins ativos", "Novos usuário admins", "Pontos distribupidos", "usuário admins por status", "Acessos por dia", "Novos cadastros por mês" e "Pedidos por dia"
No lado superior deve existir o menu principal, contendo os seguintes elementos: "Início", "Relatórios" e "Gerencial"
No menu "Gerencial" conter os seguintes submenus: "+Dashboard", "Administradores", "Área Segura", "Banners", "Redes", "Grupos", "News", "Revendas" e "usuário admins"
No menu "Relatórios" conter os seguintes submenus: "Aceite de Termos", "Acessos", "Pedidos" e "Pontos distribuídos"
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
		Então deverá conter os seguintes elementos no dashboard: "usuário admins ativos", "Novos usuário admins", "Pontos distribupidos", "usuário admins por status", "Acessos por dia", "Novos cadastros por mês" e "Pedidos por dia"
		E no menu principal: "Início", "Relatórios" e "Gerencial"
		Quando acionar a opção "Home"
		Então ocorre direcionamento para a Home da Plataforma 
		Quando acionar o menu "Gerencial"
		Então serão demonstrados os seguintes submenus: "+Dashboard", "Administradores", "Área Segura", "Banners", "Redes", "Grupos", "News", "Revendas" e "usuário admins"
		Quando acionar o menu "Relatórios"
		Então serão demonstrados os seguintes submenus: "Aceite de Termos" e "Acessos"
		Quando clicar sobre as informações do lado superior direito no avatar
		Então será exibido o menu com as opções "Alterar Senha" e "Sair"

#2 CN