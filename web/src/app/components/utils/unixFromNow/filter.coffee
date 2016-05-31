
angular.module 'MeMayor.filters'
  .filter 'unixFromNow', () ->
    return (unixValue) -> moment.unix(unixValue).fromNow()