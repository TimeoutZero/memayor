
# =============================================
# Module
# =============================================
angular.module "MeMayor.controllers"
  .controller "ProposalFormController", ($scope, $timeout, ProposalService, $state, $stateParams) ->
  
    ctrl            = @
    ctrl.categories = [
      '1'
      '2'
      '3'
      '4'  
    ]
    
    ctrl.model = 
      name       : null
      categories : []
    
    
    ctrl.actions = 
      submit: () ->
      
        promise = ProposalService.create
          cityId: $stateParams.id  
          data  : ctrl.model
        promise.then () ->
          $state.go 'simpleTheme.city.list'
    
    return @