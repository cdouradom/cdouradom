#language: pt

Funcionalidade: Banking - Minhas Vendas
 Como usuário cadastrado e ativo na campanha
 Quero acessar as minhas vendas
 Para acompanhar os registros aprovados

BD 
    SELECT * FROM aiwa_sell_out where account_id = 'IDdoUser' ORDER BY id DESC; 

-----

 Critérios de Aceitação:
Acessado através do: Menu Principal / Minhas Vendas
Exibir título: "MINHAS VENDAS"
Exibir os filtros por "Categoria", "Produto", "Data inicial ", "Data final", "Nota fiscal"  e botão "Buscar"
Filtro "Categoria" - Lista suspensa com as categorias da campanha
Exibir uma listagem com as colunas "Categoria", "Produto", "Quantidade", "Nota Fiscal", "CNPJ Revenda" e "Data"
Exibir somente as vendas do respectivo usuário logado 
Exibir apenas as vendas de arquivo aprovados
Ao fazer uma busca a listagem é atualizada conforme filtro aplicado
Para uma busca sem resultado, exibir a mensagem "Nenhuma venda encontrada"
Paginação com 20 linhas(vendas) por página

---

@manual
@Tarefa_#63798
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/B-minhas-vendas-acessar-e-layout.png
    Cenário: Minhas Vendas - Acessar e Layout
        Dado que o usuário acessou o menu "Minhas Vendas"
        Quando visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Título   | MINHAS VENDAS                                                                |
            | Filtros  | "Categoria", "Produto", "Data inicial ", "Data final", "Nota fiscal"         |
            | Botão    | Buscar                                                                       |
            | Listagem | "Categoria", "Produto", "Quantidade", "Nota Fiscal", "CNPJ Revenda" e "Data" |
        E somente o usuário do perfil "Vendedor" visualizará este menu, bem como esta tela
        E os demais perfis "Gerente Direto", "Supervisor" e "Gerente Regional" não visualizarão este menu, nem a tela mesmo quando bater a url ".../"


@manual
@Tarefa_#63798
@ajuste_#65522
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/B-minhas-vendas-listagem-e-paginacao.mp4,assets/B-minhas-vendas-listagem-e-paginacao-Vendas-Indevidas-Para-Usuário-Sem-Vendas-corrigido.png,assets/B-minhas-vendas-listagem-e-paginacao-Vendas-Indevidas-Para-Usuário-Sem-Vendas-corrigido-II.png
    Cenário: Minhas Vendas - Listagem e Paginação
        Dado que o usuário acessou a tela de "Minhas Vendas"
        Quando o usuário não possui vendas aprovadas
        Então manter listagem vazia com texto padrão "Nenhuma venda encontrada"
        Mas quando o usuário logado possui vendas aprovadas
        Então exibir na listagem as vendas do usuário logado
        E os registros são exibidos em ordem decrescente pela coluna Data
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o usuário acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros
#65522 - Não foi possível testar com usuários sem vendas, pois estão sendo demonstrada todas as vendas aprovadas, independentemente se o usuário tem vendas.

@manual
@Tarefa_#63798
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/B-minhas-vendas-filtrar.mp4
    Cenário: Minhas Vendas - Filtrar
        Dado que o usuário acessou a tela de "Minhas Vendas"
        E o usuário possui vendas aprovadas pelo admin
        Mas também possui vendas em arquivo que estão com status diferente de aprovado
        Quando o usuário "Filtrar" por parâmetros que correspondam aos registros existentes do usuário logado na aiwa_sell_out
        Então o sistema vai exibir apenas os registros correspondentes ao filtro aplicado
        E somente as vendas de arquivos aprovados serão listadas
        Quando o usuário "Filtrar" por parâmetros que não correspondam aos registros existentes do usuário logado
        Então exibir a mensagem "Nenhuma venda encontrada", pois não existem registros correspondentes ao filtro aplicado


@manual
@Tarefa_#63798
@ajuste_#65209
@manual-result:failed
@manual-last-tested:25-11-2022
@manual-test-evidence:[Evidência]
    Cenário: Minhas Vendas - Validar pontuação e Extrato
        Dado que o "usuário" possui vendas aprovadas pelo admin
        Quando acessar a tela "Extrato"
        Então os créditos serão listados com seus respectivos valores (pontos)
        E o comentário padrão sobre crédito de vendas "Crédito de pontos referente à venda <nota fiscal> de <data de venda>"
        E o saldo final atual será a soma de todos os créditos subtraínddo todos os débitos que houverem
#65209 - Não está ditribuindo ponto, não está pontuando

@manual
@Tarefa_#63798
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/B-minhas-vendas-vendas-nao-aprovadas.mp4
    Cenário: Minhas Vendas - Vendas não aprovadas
        Dado que o usuário não possui vendas aprovadas pelo admin
        Mas possui vendas reprovadas ou que estão aguardando aprovação do admin
        Quando acessar a a tela de "Minhas Vendas" no Banking
        Então não visualizará essas vendas até que sejam aprovadas
        Quando o admin fizer a aprovação
        Então o sistemá irá exibir na listagem as vendas aprovadas do usuário logado 


#5 CN