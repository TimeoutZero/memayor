
# =============================================
# Module
# =============================================
angular.module "MeMayor.controllers"
  .controller "CityListController", ($scope, cities, $timeout) ->

    ###*
     * Basic Atributes
    ###
    ctrl          = @
    ctrl.LANG_KEY = 'HOME_FEATURE'

    ctrl.cities = cities?.data or [];
    ctrl.searchDebounce = null


    ###*
     * Methods
    ###


    ###*
     * Initialize
    ###
    ctrl.actions =
      onSearch: ->



    return @


