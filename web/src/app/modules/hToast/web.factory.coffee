'use strict'

angular.module('hToast.factories')
  .factory 'hToast', (ngToast, hToastUtils, hNWToast, $window) ->

    return {
      alert   : (options = {}) ->
        ngToast.create(options)

      success : (message, options) ->
        @generic('success', message, options)

      info    : (message, options) ->
        @generic('info', message, options)

      warning : (message, options) ->
        @generic('warning', message, options)

      error   : (message, options) ->
        @generic('danger', message, options)

      generic : (className, message, options = {}) ->
        options.content          = message
        options.className        = className
        options.timeout          or= @calculateTimeout(message)

        if options.nw and $window.nw then hNWToast[className]?(message, options) else @alert(options)

      calculateTimeout: hToastUtils.calculateTimeout
    }