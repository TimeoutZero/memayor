

# =============================================
# Main Module
# =============================================
angular.module 'MeMayor'
  .config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
      .state "simpleTheme.city",
        url  : "city"
        views:
          'main@simpleTheme':
            templateUrl : "app/features/city/main/template.html"

        resolve:
          lang:  ['$translatePartialLoader', '$q', ($translatePartialLoader, $q)->
            promises = [
              $translatePartialLoader.addPart('features/city')
            ]
            return $q.all(promises)
          ]

      .state "simpleTheme.city.list",
        url  : "/list"
        views:
          '@simpleTheme.city':
            templateUrl : "app/features/city/list/template.html"
            controller  : "CityListController as listCtrl"
