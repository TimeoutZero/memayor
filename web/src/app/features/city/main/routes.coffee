

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

      .state "simpleTheme.city.profile",
        url  : "/:id"
        views:
          '@simpleTheme.city':
            templateUrl : "app/features/city/profile/template.html"
            controller  : "CityProfileController as profileCtrl"
            resolve     :
              model: ['ProposalService', '$stateParams', (ProposalService, $stateParams) ->
                return ProposalService.list($stateParams.id)
              ]
              
              info : ['CityService', '$stateParams', (CityService, $stateParams) ->
                return CityService.getById($stateParams.id)
              ]

