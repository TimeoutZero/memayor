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
            templateUrl : "app/features/proposal/main/template.html"

        # resolve:
        #   lang:  ['$translatePartialLoader', '$q', ($translatePartialLoader, $q)->
        #     promises = [
        #       $translatePartialLoader.addPart('features/proposal')
        #     ]
        #     return $q.all(promises)
        #   ]

      .state "simpleTheme.proposal.list",
        url  : "/list"
        views:
         '@simpleTheme.proposal':
            templateUrl : "app/features/proposal/list/template.html"
            controller  : "ProposalListController as listCtrl"
            resolve     :
              model: ['ProposalService', '$stateParams', (ProposalService, $stateParams) ->
                return ProposalService.list($stateParams.id)
              ]

      .state "simpleTheme.proposal.create",
        url  : "/city/:id/create"
        views:
         '@simpleTheme.proposal':
            templateUrl : "app/features/proposal/form/template.html"
            controller  : "ProposalFormController as formCtrl"
            resolve     :
              model: ['$q', ($q) ->
                return $q.when(null)
              ]


      # .state "simpleTheme.proposal.edit",
      #   url  : "/{id: int}"
      #   views:
      #    '@simpleTheme.proposal':
      #       templateUrl : "app/features/proposal/create/template.html"
      #       controller  : "ProposalFormController as formCtrl"
      #       resolve     :
      #         model: ['ProposalService', '$stateParams', (ProposalService, $stateParams) ->
      #           return ProposalService.getById($stateParams.id)
              # ]


