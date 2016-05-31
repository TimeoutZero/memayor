# =============================================
# Main Module
# =============================================
angular.module 'MeMayor'
  .config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
      .state "simpleTheme.proposal",
        url  : "proposal"
        views:
          'main@simpleTheme':
            templateUrl : "app/features/proposal/template.html"
            controller  : "ProposalController as proposalCtrl"

        resolve:
          lang:  ['$translatePartialLoader', '$q', ($translatePartialLoader, $q)->
            promises = [
              $translatePartialLoader.addPart('features/proposal')
            ]
            return $q.all(promises)
          ]
