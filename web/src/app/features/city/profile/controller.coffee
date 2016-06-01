
# =============================================
# Module
# =============================================

angular.module "MeMayor.controllers"
  .controller "CityProfileController", ($scope, model, info) ->

      ###*
      * Basic Atributes
      ###
      ctrl          = @
      ctrl.model    = model?.data or {}
      ctrl.city     = info?.data or {}


      return @