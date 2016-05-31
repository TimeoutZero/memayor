

# =============================================
# Main Module
# =============================================
angular.module 'MeMayor'
  .config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
      .state "simpleTheme.home",
        url  : "home"
        views:
          'main@simpleTheme':
            templateUrl : "app/features/home/template.html"
            controller  : "HomeController as homeCtrl"

        resolve:
          lang:  ['$translatePartialLoader', '$q', ($translatePartialLoader, $q)->
            promises = [
              $translatePartialLoader.addPart('features/home')
            ]
            return $q.all(promises)
          ]
