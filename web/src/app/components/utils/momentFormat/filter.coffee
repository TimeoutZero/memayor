
angular.module 'MeMayor.filters'
  .filter 'momentFormat', () ->
    return (value, options = {format : 'DD/MM/YYYY HH:mm'}) ->
      formattedValue = ''

      if options.isUnix
        formattedValue = moment.unix(value).format(options.format)
      else
        formattedValue = moment(value).format(options.format)

      return formattedValue