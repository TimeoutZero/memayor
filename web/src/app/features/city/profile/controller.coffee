
# =============================================
# Module
# =============================================

angular.module "MeMayor.controllers"
  .controller "CityProfileController", ($scope, model) ->

      ###*
      * Basic Atributes
      ###
      ctrl          = @
      ctrl.model    = model?.data or {}
      ctrl.proposals = [
          {
              title       : 'Movimento contra gripe A1N1',
              description : 'Distribuir vacinas contra a gripde',
              categories   : ['Healthy'],
              votes       : 158
          },
          {
              title       : 'Show do Rappa na praça',
              description : 'Show beneficiente para crianças da casa XPTO',
              categories   : ['Entertainment', 'Charity'],
              votes       : 487
          },
          {
              title       : 'Incentivo ao time de Futebol Americano',
              description : 'A cidade possui um time de FA e precisa da ajuda de vocês para fornecer equipamento adequado aos jogadores.',
              categories   : ['Sports'],
              votes       : 50
          }
      ];


      return @