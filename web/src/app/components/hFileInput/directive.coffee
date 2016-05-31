'use strict'

# =============================================
# Module
# =============================================
angular.module 'MeMayor.directives'


  .directive 'hFileInput', ($rootScope, $timeout) ->
    restrict   : 'A'
    transclude : yes
    replace    : yes
    scope      :
      angularUploader  : "="
      fileInputId      : "@"
      inputTitle       : "@?"

    controller  : ['$scope', ($scope) ->

      # =============================================
      # Attributes
      # =============================================
      # $scope.editMode   = no

      # =============================================
      # Methods
      # =============================================
      $scope.choseFile = ->
        angular.element("##{$scope.fileInputId}").click()
        return

      return @

    ]
    # link : (scope, element, attrs) ->
    #   $scope.editMode = yes if angular.isDefined(attrs.editMode)

    template: """

      <div class="h-file-wrapper">
        <input type="file"
          class="h-file-input"
          id="{{fileInputId}}"
          nv-file-select=""
          uploader="angularUploader"
          >
        <div ng-transclude ng-click="choseFile()"></div>
      </div>
    """