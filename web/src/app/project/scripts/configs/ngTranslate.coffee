'use strict'

# =============================================
# Module
# =============================================
angular.module 'MeMayor'
  .config( ($translateProvider, tmhDynamicLocaleProvider) ->

      tmhDynamicLocaleProvider.localeLocationPattern 'app/project/scripts/environment/locale/angular-locale_{{locale}}.env.js'

      $translateProvider.useMessageFormatInterpolation()
      $translateProvider.useMissingTranslationHandlerLog();

      $translateProvider.useLoader('$translatePartialLoader', {
        urlTemplate: 'app/{part}/i18n/{lang}.json'
      }).useSanitizeValueStrategy('escaped')
      .preferredLanguage('pt-br')
      .fallbackLanguage('pt-br')

      moment.locale('pt-br')
  ).run ($rootScope, $translate, $translatePartialLoader, tmhDynamicLocale)->

    tmhDynamicLocale.set('pt-br')

    $rootScope.$on '$translatePartialLoaderStructureChanged', ()->
      $translate.refresh()

    $translatePartialLoader.addPart('project')
