
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

      return @