
# =============================================
# Module
# =============================================
angular.module "MeMayor.controllers"
  .controller "HomeController", ($scope) ->

    ###*
     * Basic Atributes
    ###
    ctrl          = @
    ctrl.LANG_KEY = 'HOME_FEATURE'
    
    ctrl.cities = [
      { name : 'Itapecerica da Serra', idh : 0.862  , score : 0 },
      { name : 'Taboão da Serra', idh : 0.758       , score : 11 },
      { name : 'Embu das artes', idh : 0.945        , score : 68 },
    ];
      

    ###*
     * Methods
    ###
    

    ###*
     * Initialize
    ###



    return @


