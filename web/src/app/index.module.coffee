angular.module "MeMayor.vendors", [
  "ngTouch"
  "ngSanitize"
  "ngResource"
  "ui.router"
  "ui.bootstrap"
  "ui.select"
  "oitozero.ngSweetAlert"
  "ngToast"
  "angular-loading-bar"
  "pascalprecht.translate"
  "agGrid"
  "hToast"
  "hDefaults"
  'angularFileUpload'
  'tmh.dynamicLocale'
]

# =============================================
# Modules
# =============================================
angular.module "MeMayor.controllers" , ["MeMayor.vendors"]
angular.module "MeMayor.filters"     , ["MeMayor.vendors"]
angular.module "MeMayor.factories"   , ["MeMayor.vendors"]
angular.module "MeMayor.constants"   , ["MeMayor.vendors"]
angular.module "MeMayor.services"    , ["MeMayor.vendors"]
angular.module "MeMayor.directives"  , ["MeMayor.vendors"]
angular.module "MeMayor.mocks"       , ["MeMayor.vendors"]
angular.module "MeMayor.i18n"        , ["MeMayor.vendors"]
angular.module "MeMayor.configs"     , ["MeMayor.vendors"]
angular.module "MeMayor.providers"   , ["MeMayor.vendors"]



# =============================================
# Scripts Module
# =============================================
angular.module "MeMayor.scripts"     , [
  "MeMayor.controllers"
  "MeMayor.constants"
  "MeMayor.filters"
  "MeMayor.factories"
  "MeMayor.services"
  "MeMayor.directives"
  "MeMayor.mocks"
  "MeMayor.i18n"
  "MeMayor.providers"
  "MeMayor.configs"
]


# =============================================
# Main Module
# =============================================
angular.module "MeMayor", [
  "MeMayor.scripts"
  "MeMayor.vendors"
]