
# =============================================
# Module
# =============================================
angular.module "MeMayor.controllers"
  .controller "CityListController", ($scope, $timeout, CityService) ->

    ###*
     * Basic Atributes
    ###
    ctrl          = @
    ctrl.LANG_KEY = 'HOME_FEATURE'

    ctrl.cities = cities?.data or [];
    ctrl.searchDebounce = null
    ctrl.madeOneSearch  = no

    ###*
     * Methods
    ###

    ###*
     * Initialize
    ###
    ctrl.actions =

      search: ->
        promise = CityService.search({
          name: ctrl.search
        })

        promise.then (response) ->
          ctrl.cities = response.data

        promise.finally () ->
          ctrl.madeOneSearch = yes



      onTypeSearch: ->
        if ctrl.searchDebounce
          $timeout.cancel(ctrl.searchDebounce)
          ctrl.searchDebounce = null

        debounce = () ->
          if ctrl.search
            ctrl.actions.search()
          else
            ctrl.cities = []

        ctrl.searchDebounce = $timeout debounce, 700



    return @


