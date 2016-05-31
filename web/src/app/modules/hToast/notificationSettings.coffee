
angular.module('hToast')
  .config ['ngToastProvider', (ngToastProvider) ->

    ngToastProvider.configure
      verticalPosition   : 'top'
      horizontalPosition : 'right'
      maxNumber          : 2
      dismissButton      : true
      timeout            : 4000
      dismissButtonHtml  : """
        <span class="icon icon-adm-close"></span>
      """

  ]