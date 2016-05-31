

###
  ## Login base route
###
angular.module 'MeMayor'
  .config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
      .state "simpleTheme",
        url         : "/"
        abstract    : yes
        views:
          '':
            templateUrl : "app/project/scripts/baseRoutes/simpleTheme.html"
            controller  : 'BaseRouteController'
            resolve     :
              lang:  ['$translatePartialLoader', '$q', ($translatePartialLoader, $q)->
                promises = [
                  $translatePartialLoader.addPart('modules/hDefaults/components/hGrid')
                ]
                return $q.all(promises)
              ]



    $urlRouterProvider.otherwise '/city/list'