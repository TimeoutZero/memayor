
angular.module 'MeMayor.directives'
  .directive 'unixFromNow', ($filter, $interval) ->
    scope:
      unixValue: '='
    link: (scope, element, attrs) ->
      scope.intervalInstance = null

      scope.actions =
        updateViewValue: () ->
          element.html $filter('unixFromNow')(scope.unixValue)

        ###*
         * Improves performance to interval calculating a longer time to update
         * @method calculateIntervalTime
         * @return {int} Time in millis
        ###
        calculateIntervalTime: () ->
          hoursFromNow = moment.unix(scope.unixValue).hours()
          oneMinute    = 60000 # one minute (in millis)
          time         = oneMinute

          if hoursFromNow > 1 and hoursFromNow < 24
            time = 3600000   # (oneMinute * 60) -> one hour
          else if hoursFromNow > 24 and hoursFromNow < 720
            time = 86400000  # (oneMinute * 60) * 24 -> one day
          else if hoursFromNow > 720 # one month
            time = 2592000000 # one month

          return time



        destroyInterval: () ->
          if scope.intervalInstance
            scope.intervalInstance.cancel()
            scope.intervalInstance = null


      ###*
       * Initialize
      ###
      scope.actions.updateViewValue()
      scope.intervalInstance = $interval scope.actions.updateViewValue, scope.actions.calculateIntervalTime()

      scope.$on '$destroy', scope.actions.destroyInterval
      element.on '$destroy', scope.actions.destroyInterval



