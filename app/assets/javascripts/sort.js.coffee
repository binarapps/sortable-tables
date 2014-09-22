jQuery ->

  $('.sortable').sortable(
    axis: 'y'
    items: '.item'
    # highlight the row on drop to indicate an update
    stop: (e, ui) ->
      ui.item.children('td').effect('highlight', {}, 1000)
    update: (e, ui) ->
      my_url = $(this)[0].dataset.updateUrl
      item_id = ui.item[0].dataset.itemId
      page = $(this)[0].dataset.page
      position = ui.item.index()
      $.ajax(
        type: 'POST'
        url: my_url
        dataType: 'json'
        data: { id: item_id, position: position, page: page }
      )
  )