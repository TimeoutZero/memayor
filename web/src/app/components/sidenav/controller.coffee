
'use strict'

angular.module "MeMayor.controllers"
  .controller "SideNavCtrl", ($scope, $timeout) ->
    ###
    ## Init
    ###
    $scope.attrs =
      features : []


    $timeout ->
      $scope.attrs.features = [
        { name: 'SIDENAV.COMPANIES', route: 'sidebarTheme.company', icon: 'glyphicon glyphicon-briefcase' }
        { name: 'SIDENAV.QUEUES'   , route: 'sidebarTheme.queue', icon: 'glyphicon glyphicon-tasks' }
        { name: 'SIDENAV.LOGS'     , route: 'sidebarTheme.log', icon: 'glyphicon glyphicon-list-alt' }
        { name: 'SIDENAV.USERS'    , route: 'sidebarTheme.users', icon: 'glyphicon glyphicon-user' }
      ]


