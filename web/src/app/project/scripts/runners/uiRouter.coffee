
# =============================================
# Module
# =============================================
angular.module 'MeMayor'
  .run ['$rootScope', ($rootScope) ->

    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->

      $rootScope.sidenavHidden = toState.data?.sidenavHidden

      $rootScope.state =
        state  : toState
        params : toParams

      $rootScope.lastState =
        state  : fromState
        params : fromParams


    $rootScope.$on '$stateChangeError' , (event, toState, toParams, fromState, fromParams, error) ->
      console.group()
      console.log('[$stateChangeError]')
      console.table([event, toState, toParams, fromState, fromParams, error], ['name', 'url', 'resolve', 'message'])
      console.groupEnd()
      debugger


    # $rootScope.$on '$stateChangeStart' , (event, toState, toParams, fromState, fromParams, error) ->
    #   console.group()
    #   console.log('[$stateChangeStart]')
    #   console.table([event, toState, toParams, fromState, fromParams, error], ['name', 'url', 'resolve', 'message'])
    #   console.groupEnd()

    # $rootScope.$on '$stateChangeSuccess' , (event, toState, toParams, fromState, fromParams, error) ->
    #   console.group()
    #   console.log('[$stateChangeSuccess]')
    #   console.table([event, toState, toParams, fromState, fromParams, error], ['name', 'url', 'resolve', 'message'])
    #   console.groupEnd()
  ]

