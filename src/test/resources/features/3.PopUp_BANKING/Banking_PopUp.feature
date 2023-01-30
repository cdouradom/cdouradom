#language: pt

Funcionalidade: Banking - Pop Up
 Como usuário participante desta campanha
 Quero visualizar os pop ups na plataforma banking
 Para acompanhar os alertas e informações da campanha

-----

Critérios de Aceitação:
 Exibir todos os Pop-Ups conforme a ordem de exibição, independente da ação positiva
 Nova exibição (reexibição) de cada pop up deve ser feita conforme sua frequência e ordenação
 Não visualizar pop ups que ainda não atingiram sua data de exibição
 Não visualizar pop ups inativados
 Visualizar pop ups cadastrados instantaneamente quando a data de exibição é igual a atual
 Frequência "Sempre" mostra o pop up sempre que a tela é carregada/recarregada e após ele nenhum outro pop-up é exibido
 Frequência "Todo Login" mostra o pop up toda vez que o usuário loga no sistema
 Frequência "Todo Dia" mostra o pop up todos os dias
 Frequência "Uma vez" mostra o pop up uma única vez
 Frequência "Ação Positiva" mostra o pop up até que o usuário clique no botão de ação positiva
 Frequência "Confirmação" mostra o pop up até que o usuário clique no botão de ação de confirmação

---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Up - Layout do Modal
        Quando o usuário acessar a tela configurada para a visualização do "Pop Up"
        E cada "Pop Up" terá seu modal contendo as informações de acordo com a configuração feita pelo admin
        Então os elementos da tela estão alinhados corretamente


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Up - Apresentação dos Modais
        Quando existe somente um Pop Up cadastrado para uma respectiva tela, vigente e disponibilizado para o usuário
        Então terá somente um modal
        Quando existe dois ou mais Pop Ups cadastrados para uma respectiva tela, vigentes e disponibilizados para o usuário
        Então serão apresentados um por vez na sequência de cadastro do mais antigo para o mais novo
       

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Up - Sem datas definidas
        Dado que o usuário está logado na plataforma banking da campanha
        E acessar uma tela 
        Quando existem pop ups sem datas definidas
        Então todos os pop ups que não possuem datas definidas são exibidos


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Up - Fora da vigência
        Dado que o usuário está logado na plataforma banking da campanha
        Quando existem pop ups com "Data Inicial" futura
        Então esses pop ups não serão exibidos para os usuários
        Quando o pop up possui "Data Final" do passado
        Então esse pop up não será mais exibido para os usuários


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Up - Ordenação
        Quando existem dois ou mais pop ups cadastrados na mesma tela
        E o admin realiza a ordenação
        Então eles serão exibidas conforme a respectiva alteração
       

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Up - com usuário segmentado
        Dado que o usuário está logado na plataforma banking da campanha
        Quando o pop up está definido para um "Perfil", "Grupo", "Região" e "Segmento"
        E este usuário está dentro do público da segmentação deste pop up
        Então este usuário verá o pop up na respectiva tela cadastrada


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Up - Inativo
        Dado que o usuário está logado na plataforma banking da Campanha
        E está visualizando um pop up na respectiva tela
        Quando um admin inativar este pop up via Plataforma
        E o usuário atualizar sua tela 
        Então o pop up inativado pelo admin não mais aparecerá para o usuário

#7 CN
