
angular.module 'MeMayor'
  .directive 'mmBanner', () ->
    restrict    : 'AE'
    transclude  : yes
    templateUrl : 'app/components/mmBanner/template.html'
