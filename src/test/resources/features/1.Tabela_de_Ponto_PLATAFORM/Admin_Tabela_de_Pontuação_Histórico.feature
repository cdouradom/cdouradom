#language: pt

Funcionalidade: Histórico de Produtos
Como usuário administrador ativo na Plataforma
Quero acessar a tela do histórico dos produtos
Para visualizar o histórico de alterações deste produto e em todas as tabelas

    BD 
        product_points_import_history
        product_points_import_resale
        account_campaign_product_points

-----    

Critérios de Aceitação:
Exibir breadcrumb
Acesso através do menu: Tabela de Pontuação / Ações / Editar Dados / Histórico
Exibir um cabeçalho na tela concatenando as informações "PRODUTO - +PartNumber - +Nome/Modelo do Produto"
Exibir acima da listagem o texto informativo: "Foram encontrados ** registros" que é atualizado conforme filtros aplixado X resultados na listagem
Exibir uma listagem com cabeçalho: "Id da tabela", "SKU", "EAN", "Produto", "Cargo", "Pontos" e "Vigência"

---

@manual
@tarefa_#:61020
@ajuste_#:62465
@manual-result:success
@manual-last-tested:20-10-2022
@manual-test-evidence:assets/A-historico-de-produto-acessar-e-layout.mp4
    Cenário: Histórico de Produto - Acessar e Layout
        Dado que existem registros listados na tela "Tabela de Pontuação"
        Quando o admin acionar o botão "Ações" de um produto da tabela filtrada
        E acionar a opção "Histórico"
        Então o sistema redireciona para a tela "Histórico de Pontos" do respectivo Produto
        E todos os registros com este produto serão listados
        Quando o usuário visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
#62465 - Ao clicar em Histórico o sistema desloga

@manual
@tarefa_#:61020
@ajuste_#:62494
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-historico-de-produto-editar-produto-e-visualizar-novos-historicos.png
   Cenário: Histórico de Produto - Editar Produto e visualizar novos Históricos
        Dado que existem registros listados na tela "Tabela de Pontuação"
        Quando o admin acionar o botão "Ações" de um produto da tabela filtrada
        E acionar a opção "Editar"
        Então o sistema redireciona para a tela "Editar Produtos" do respectivo Produto
        Quando o usuário editar os campos"Pontos Vendedor", "Pontos Gerente Direto", "Pontos Supervisor" e "Pontos Gerente Regional" e "<Status>"
        E acionar o botão "Salvar"
        Então o sistema redireciona para a "Tabela de Pontuação"
        E o registro no histórico do produto conterá as edições realizadas
        Quando o admin acionar o botão "Ações" desse produto
        E acionar a opção "Histórico"
        Então o sistema redireciona para a tela "Histórico de Pontos" do respectivo Produto
        E todos os registros com este SKU serão listados, contemplando todas as edições de todas as tabelas
        E exibirá uma linha para cada perfil
#62494 - Não está sendo possível Editrar, Salvar ou Cancelar 

@manual
@tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
   Cenário: Histórico de Produto - Exportar Registros 
    #confirmar se terá no momento to teste, pois essa tela não tem exportação, nem paginação, e nem filtros por padrão
    #se houver, criar cenário e executar teste