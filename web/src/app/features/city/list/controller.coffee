
# =============================================
# Module
# =============================================
angular.module "MeMayor.controllers"
  .controller "CityListController", ($scope, cities) ->

    ###*
     * Basic Atributes
    ###
    ctrl          = @
    ctrl.LANG_KEY = 'HOME_FEATURE'

    ctrl.cities = cities?.data or [];


    ###*
     * Methods
    ###


    ###*
     * Initialize
    ###



    return @


