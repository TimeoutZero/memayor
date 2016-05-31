angular.module 'hDefaults.factories'
.service 'hGrid', ($translatePartialLoader, $translate, $timeout, alphanumSort)->

  translateKey = 'HGRIDDEFAULTS.'

  ###*
  hGrid service for ag-grid defaults
  @type {Object}
  ###
  return service =
    ###*
    createOptions for angular ag-grid
    @method createOptions
    @param  {Object}      config   Options for ag-grid to override defaults
    @param  {Boolean}      viewOnly toggle sorting for table and row actions
    @return {Object}               ag-grid options
    ###
    createOptions: (config, viewOnly)->
      ###*
      gridOptions default values for ag-grid
      @type {Object}
      ###
      gridOptions =
        localeText:
          page: $translate.instant(translateKey + 'PAGE')
          more: $translate.instant(translateKey + 'MORE')
          to: $translate.instant(translateKey + 'TO')
          of: $translate.instant(translateKey + 'OF')
          next: $translate.instant(translateKey + 'NEXT')
          last: $translate.instant(translateKey + 'LAST')
          first: $translate.instant(translateKey + 'FIRST')
          previous: $translate.instant(translateKey + 'PREVIOUS')
          loadingOoo: $translate.instant(translateKey + 'LOADING')
        sortingOrder: ['asc','desc',null]
        rowHeight: 40
        headerHeight: 40
        rowSelection: if viewOnly then 'single' else false
        unSortIcon: !viewOnly
        enableSorting : !viewOnly
        suppressHorizontalScroll: true
        suppressCellSelection: true
        suppressRowClickSelection: viewOnly
        onReady: (event)->
          event.api.sizeColumnsToFit()

      angular.extend {}, gridOptions, config

    sortData: (sortModel, data)->
      sortPresent = sortModel && sortModel.length > 0
      if !sortPresent
        return data
      # do an in memory sort of the data, across all the fields
      resultOfSort = data.slice()
      for sortColModel in sortModel
        resultOfSort = resultOfSort.sort (a,b)->
          valueA = a[sortColModel.colId]
          valueB = b[sortColModel.colId]
          alphanumSort(valueA, valueB)

        if sortColModel.sort is 'desc'
          resultOfSort = resultOfSort.reverse()

      return resultOfSort

    createDataSource: (gridOptions, data)->
      $timeout ->
        dataSource =
          rowCount: data.length # behave as infinite scroll if null
          pageSize: 50
          overflowSize: 50
          maxConcurrentRequests: 1
          maxPagesInCache: 1
          getRows: (params)->
            allOfTheData = data
            dataAfterSortingAndFiltering = service.sortData(params.sortModel, allOfTheData)

            rowsThisPage = dataAfterSortingAndFiltering.slice(params.startRow, params.endRow)

            # if on or after the last page, work out the last row.
            lastRow = -1
            if dataAfterSortingAndFiltering.length <= params.endRow
              lastRow = dataAfterSortingAndFiltering.length

            # call the success callback
            params.successCallback(rowsThisPage, lastRow)

        gridOptions.api.setDatasource(dataSource)
        gridOptions.api.sizeColumnsToFit()
