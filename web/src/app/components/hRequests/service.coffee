###*
hRequest service
@method hRequest
@param  {Object} $http      $http service
@param  {Object} hToast     hToast module factory
@param  {Object} $translate $translate service
@return {Object}            angular service
###
angular.module 'MeMayor.services'
  .service 'hRequest', ($q, $http, hToast, $translate, hAlert)->
    translated = (msgKey, result)->
      return msgKey isnt result


    return service = {

      FETCH_STRATEGY:
        EAGER : 'EAGER'
        LAZY  : 'LAZY'

      ###*
      resolved request default callback
      @method resolved
      @param  {String} msgKey Base key to i18n
      ###
      resolved: (msgKey, msgData, interpolation)->
        return if !msgKey?
        msgKey += '.SUCCESS'
        msg = $translate(msgKey, msgData, interpolation)
        msg.then (msg)->
          if !translated(msgKey, msg)
            msg = $translate.instant('CRUD.ALERTS.DEFAULT.SUCCESS', msgData, interpolation)
          hToast.success(msg) unless _.isEmpty(msg)

      ###*
      rejected request default callback
      @method rejected
      @param  {Object} res    Response Object from server
      @param  {String} msgKey Base key to i18n
      ###
      rejected: (res, msgKey, msgData = {}, interpolation)->
        return if !msgKey?
        reason  = null
        details = []

        tryToTranslateByReason = () ->
          defer = $q.defer()

          if res.data?.reason
            details = res.data.reason.split(':') or []
            reason  = details.splice(0, 1)
            angular.extend msgData, { resDetails: details }

          errorKey = msgKey + '.ERROR.' + (reason || 'DEFAULT')
          $translate(errorKey, msgData, interpolation).then (msg) ->
            if translated(errorKey, msg) then defer.resolve(msg) else defer.reject()

          return defer.promise

        tryToTranslateByLocalDefaultMessage = () ->
          defer = $q.defer()

          errorKey = "#{msgKey}.ERROR.DEFAULT"
          $translate(errorKey, msgData, interpolation).then (msg) ->
            if translated(errorKey, msg) then defer.resolve(msg) else defer.reject()

          return defer.promise

        tryToTranslateByGeneralDefaultMessage = () ->
          defer         = $q.defer()
          defaultMsgKey = 'CRUD.ALERTS.DEFAULT.ERROR.DEFAULT'
          msg = $translate.instant(defaultMsgKey, msgData, interpolation)
          defer.resolve(msg)

          return defer.promise

        showMessage =  (msg) ->
          hToast.error(msg)
          return null

        messageResolverStack = [
          tryToTranslateByReason
          tryToTranslateByLocalDefaultMessage
          tryToTranslateByGeneralDefaultMessage
        ]
        reduceFn      = (current, next) -> current.catch(next)
        reducePromise = messageResolverStack.reduce reduceFn, $q.reject()
        reducePromise.then(showMessage)






      ###*
      Wrapper for post requests
      @method post
      @param  {Object} config $http like config
      @return {Promise}       Returns an $http Promise
      ###
      post: (config)->
        reqConfig =
          method: 'POST'

        request = service.send(angular.extend(reqConfig, config))

        return request

      ###*
      Wrapper for put requests
      @method put
      @param  {Object} config $http like config
      @return {Promise}       Returns an $http Promise
      ###
      put: (config)->
        reqConfig =
          method: 'PUT'

        request = service.send(angular.extend(reqConfig, config))

        return request

      ###*
      Wrapper for get requests
      @method get
      @param  {Object} config $http like config
      @return {Promise}       Returns an $http Promise
      ###
      get: (config)->
        reqConfig =
          method: 'GET'

        request = service.send(angular.extend(reqConfig, config))

        return request

      ###*
      Wrapper for delete request
      @method remove
      @param  {Object} config $http like config
      @return {Promise}       Returns an $http Promise
      ###
      remove: (config)->
        reqConfig =
          method: 'DELETE'
          confirm: true

        request = service.send(angular.extend(reqConfig, config))

        return request

      ###*
      Wrapper for all request
      @method post
      @param  {Object} config $http like config
      @return {Promise}       Returns an $http Promise
      ###
      send: (config)->
        defer = $q.defer()

        if config.confirm
          alertConfig = angular.extend {
            closeOnConfirm: true
            html: yes
            title: ""
            text: ""
          }, config.confirmSettings

          confirm = (isConfirm)->
            if isConfirm
              request = service.sendRequest(config)
              request.then(defer.resolve, defer.reject)
            else
              config.onCancel?()
              defer.reject('canceled')

          hAlert.confirm(alertConfig, confirm)

        else
          request = service.sendRequest(config)
          request.then(defer.resolve, defer.reject)

        return defer.promise


      sendRequest: (config)->
        request = $http(config)

        request.then ()->
          interpolation = config.interpolation?.success or= config.interpolation
          service.resolved(config.msgKey, config.msgData, interpolation)

        request.catch (res)->
          interpolation = config.interpolation?.error or= config.interpolation
          service.rejected(res, config.msgKey, config.msgData, interpolation)

        return request

    }
