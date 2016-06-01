

angular.module "MeMayor.controllers"
  .service "CityService", ($q) ->

    return {
      list: ->
        $q.when
          data: [
            { _id: 1, name : 'Itapecerica da Serra', idh : 0.862  , score : 0 }
            { _id: 2, name : 'Taboão da Serra', idh : 0.758       , score : 11 }
            { _id: 3, name : 'Embu das artes', idh : 0.945        , score : 68 }
          ]

       getById: ->
        $q.when data: {}

    }

