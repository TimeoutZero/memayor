'use strict'

###
## [MODULE] LoadingBar
___

**App Config**
###
angular.module 'MeMayor.configs'
  .config [ 'cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.includeSpinner = no
    cfpLoadingBarProvider.latencyThreshold = 250
  ]
