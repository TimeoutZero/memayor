
angular.module "MeMayor.controllers"
  .service "ProposalService", ($q, APP_ENV, hRequest) ->

    return {

       list : (cityId, config = {}) ->
        angular.extend config,
          url: "#{APP_ENV.API_BASE_URL}city/#{cityId}/proposal"
        hRequest.get(config)

       getById: ->
       
       
       create: (data = {}, config = {}) ->
         angular.extend config,
           url  : "#{APP_ENV.API_BASE_URL}city/#{data.cityId}/proposal"
           data : data.data
        
         hRequest.post(config)


    }
