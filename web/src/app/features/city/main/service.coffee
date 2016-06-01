

angular.module "MeMayor.controllers"
  .service "CityService", ($q, APP_ENV, hRequest, $window) ->

    return {

      search: (data = {}, config = {}) ->
        angular.extend config,
          url: "#{APP_ENV.API_BASE_URL}city/search?#{$.param(data)}"

        hRequest.get(config)
       
       findByWikiDetails : (cityId, config = {}) ->
        
         promise = @.getById(cityId)
         promise.then (response) ->
         
          angular.extend config,
            url : "https://pt.wikipedia.org/w/api.php?action=query&prop=extracts&titles=#{response.data.name}&format=json&exintro=1"
            headers:
              Origin: $window.location.origin
          hRequest.get(config)

       
       getById : (cityId, config = {}) ->
        angular.extend config,
          url: "#{APP_ENV.API_BASE_URL}city/#{cityId}"

        hRequest.get(config)

    }

