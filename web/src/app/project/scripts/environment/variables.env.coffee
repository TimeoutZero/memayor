

window.mmEnv =
  AUTH_REDIRECT     : 'home'
  NOT_AUTH_REDIRECT : 'login.auth'
  API_BASE_URL      : '/'
  GA                :
    MAIN : 'UA-XXXXXXXX-X'
    VERSION_DIMENSION: "dimension1"



window.Config or= {}
_(window.mmEnv).extend window.Config