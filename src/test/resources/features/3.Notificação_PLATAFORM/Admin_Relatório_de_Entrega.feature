



Cenário: Relatório de entrega - Layout
    Dado que o admin está na tela de "Notificaçãos"
    E acionou o botão "Ações" de Notificação
    Quando acionar a opção " Relatório de entrega"
    Então o sistema redireciona o admin para a listagem de "Relatório de entrega", com listagem conforme colunas abaixo
    E botão "Exportar Registros"
    | Título | Data de Envio | Enviadas | Visualizadas |
    E os elementos da tela estão alinhados corretamente

Cenário: Relatório de entrega no status Agendado 
    Dado que o admin está na tela de "Notificaçãos"
    E acionou o botão "Ações" de Notificação no status "Agendado"
    Quando acionar a opção " Relatório de entrega"
    Então o sistema redireciona o admin para a listagem de "Relatório de entrega"
    Mas estará vazia, pois a notificação ainda não foi enviada
    Quando o admin cicar em "Exportar Registros" o sistema gera e exporta um arquivo .xlsx
    Mas contendo somente o cabeçalho, visto que a notificação ainda não foi enviada

Cenário: Relatório de entrega no status Enviado
    Dado que o admin está na tela de "Notificaçãos"
    E acionou o botão "Ações" de Notificação no status "Enviado"
    Quando acionar a opção " Relatório de entrega"
    Então o sistema redireciona o admin para a listagem de "Relatório de entrega"
    E serão exibidos na listagem da tela, todos os disparo para a resectiva "Notificação"
    Quando o admin cicar em "Exportar Registros" o sistema gera e exporta um arquivo .xlsx conforme colunas abaixo
    | CPF do usuário | Nome | Revenda (CNPJ+Nome Fantasia) | Notificação (Título) | Data do envio | Data da visualização |
    E todos os registros exibidos em tela constarão no arquivo Excel
