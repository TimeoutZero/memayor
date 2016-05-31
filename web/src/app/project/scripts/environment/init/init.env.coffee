$(document).ready ->

  window.mmEnv or= {}
  setupData                         = {}
  waitForSetup                      = false
  mmEnv             = window.mmEnv
  window.mmEnv.user = null

  # Bootstrap da aplicação
  bootstrap = ->
    angular.bootstrap(document, ["MeMayor"])


  bootstrap()