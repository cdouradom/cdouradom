#language: pt

Funcionalidade: Banking - Extrato de Pontos
 Como usuário cadastrado e ativo na campanha
 Quero acessar o extrato de pontos
 Para acompanhar meus saldo e os valores creditados e debitados

-----

 Critérios de Aceitação:
SELECT * FROM `point_statement ` where account_id = '' ORDER BY id DESC;

---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Extrato de Pontos - Acessar e Layout
        Dado que o usuário acessou o "Extrato de Pontos"
        Quando visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs                                                      |
            | Filtro Tipo: 'Crédito Liberado', 'Crédito Resgatado ou Debitado' |
            | Filtros Data Inicial e "Data Final                               |
            | Botão Buscar                                                     |
            | Saldo atual (independentemente dos filtros)                      |
            | Legendas (L e R)                                                 |
            | Listagem de pontos creditados e/ou debitados                     |
            | Colunas 'Tipo', 'Data', Descrição', 'Pontos' e 'Saldo'           |
        
@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Extrato de Pontos - Listagem e Paginação
        Dado que o usuário está no "Extrato de Pontos"
        Quando o usuário logado possui registros de créditos e/ou débitos
        Então a listagem e saldo refletem conforme registros do usuário logado
        E os registros são exibidos em ordem decrescente pela Data
        E a descrição é conforme comentário no registro do ponto
        E os débitos possuem valor negativo (-)
        E o saldo atual do usuário logado é o resultado do cálculo confome a coluna pontos
        Mas os registros de pontos créditos e/ou débitos não pode ser valor ZERO
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o usuário acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros
        Mas quando o usuário não possui extrato de pontos
        Então manter listagem vazia com texto padrão "Nenhum registro encontrado."



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Extrato de Pontos - Filtrar
        Dado que o usuário está na tela "Extrato de Pontos"
        Quando "Buscar" por parâmetros que possuam registros existentes neste extrato
        Então o sistema vai exibir apenas os registros correspondentes ao filtro aplicado
        Quando "Buscar" por parâmetros não que possuem registros neste extrato
        Então o sistema não exibir nada, pois não existem registros correspondentes ao filtro aplicado
    
#3 CN