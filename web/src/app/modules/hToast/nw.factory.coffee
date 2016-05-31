'use strict'

angular.module('hToast.factories')
  .factory 'hNWToast', ($timeout, hToastUtils, $window) ->

    return API = {
      lastNotification: null
      notifier        : if $window.nw then require('node-notifier') else null

      alert   : (options = {}) ->
        API.lastNotification = API.notifier.notify options

      close: (instance = API.lastNotification) ->
        instance?.close()

      success : (message, options) ->
        @generic(message, options)

      info    : (message, options) ->
        @generic(message, options)

      warning : (message, options) ->
        @generic(message, options)

      error   : (message, options) ->
        @generic(message, options)

      generic : (message, options = {}) ->
        options.message = message
        options.title   or= $window.nw.App.manifest.name

        options.timeout          or= @calculateTimeout(message)
        @alert(options)

      calculateTimeout: hToastUtils.calculateTimeout

    }