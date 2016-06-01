

angular.module "MeMayor.controllers"
  .service "CityService", ($q, APP_ENV, hRequest) ->

    return {

      search: (data = {}, config = {}) ->
        angular.extend config,
          url: "#{APP_ENV.API_BASE_URL}city/search?#{$.param(data)}"

        hRequest.get(config)

       getById: ->


    }

