'use strict'

angular.module('hToast.factories')
  .factory 'hToastUtils', () ->

    return API = {

      calculateTimeout: (message = "") ->
        message          = message.toString()
        aditionalTimeout = 0
        minTime          = 4000
        totalTime        = 0

        # Get the html for jQuery objects
        if message.html
          message          = message.html()
          aditionalTimeout = ( message.indexOf("<a>") > -1 ? 2000 : 0 )

        # Average 150 words per minute
        totalTime = ( message.split(" ").length * 600 ) + aditionalTimeout
        unless totalTime > minTime then totalTime = minTime

        return totalTime
    }