
# =============================================
# Module
# =============================================

angular.module "MeMayor.controllers"
  .controller "ProposalController", ($scope) ->
  
      ###*
      * Basic Atributes
      ###
      ctrl          = @
      ctrl.proposals = [
          {
              title       : 'Movimento contra gripe A1N1',
              description : 'Distribuir vacinas contra a gripde',
              categorys   : ['Healthy'],
              votes       : 158
          },
          {
              title       : 'Show do Rappa na praça',
              description : 'Show beneficiente para crianças da casa XPTO',
              categorys   : ['Entertainment', 'Charity'],
              votes       : 487
          },
          {
              title       : 'Incentivo ao time de Futebol Americano',
              description : 'A cidade possui um time de FA e precisa da ajuda de vocês para fornecer equipamento adequado aos jogadores.',
              categorys   : ['Sports'],
              votes       : 50
          }
      ];
      
      
      return @