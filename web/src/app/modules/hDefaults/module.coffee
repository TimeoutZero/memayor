# =============================================
# Modules
# =============================================
# angular.module 'hDefaults.controllers' , []
# angular.module 'hDefaults.filters'     , []
angular.module 'hDefaults.factories'   , []
angular.module 'hDefaults.services'    , []
angular.module 'hDefaults.constants'   , []
# angular.module 'hDefaults.directives'  , []
# angular.module 'hDefaults.mocks'       , []
# angular.module 'hDefaults.providers'   , []



# =============================================
# Scripts Module
# =============================================
angular.module 'hDefaults.scripts'     , [
  # 'hDefaults.controllers'
  # 'hDefaults.filters'
  'hDefaults.factories'
  'hDefaults.services'
  'hDefaults.constants'
  # 'hDefaults.directives'
  # 'hDefaults.mocks'
  # 'hDefaults.providers'
]


# =============================================
# Main Module
# =============================================
angular.module 'hDefaults', [
  'ngSanitize'
  'ngResource'
  'hDefaults.scripts'
]