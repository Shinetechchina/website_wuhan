App.CustomBoxes =

  init: ->
    @selectBoxableType()
    @toggleEditBoxIcons()
    @rearrangedBoxes()

  selectBoxableType: ->
    $('#box_boxable_type').on 'change', ->
      url = '/boxes/select_type'
      $.post(url + "?boxable_type=" + $(this).val()).success (result) ->
        $('#box_boxable_id').html(result)

  toggleEditBoxIcons: ->
    self = @
    span = $('#edit-boxes').find('span')
    editBoxIcons = '<div class="edit-box-icons"><i class="icon-remove-sign remove-box-icon"></i><i class="icon-link set-url-icon"></i></div>'

    $('#edit-boxes').on 'click', ->
      routeBoxes = $('.box.route')
      if $('.box-404').length > 0
        alert('Can not edit boxes in 404 page')
      else
        App.BoxManager.shapeshiftEnableDrag(true)
        routeBoxes.removeClass('route')
        if $(".edit-box-icons").length == 0
          $(".box").not('.new-box').prepend(editBoxIcons)
          self.editBoxEvents()
          span.html('UPDATE')
        else
          if not $(".edit-box-icons").is(":visible")
            $(".edit-box-icons").show()
            span.html('UPDATE')
          else if $(".edit-box-icons").is(":visible")
            self.hideEditBoxIcons()
            routeBoxes.addClass('route')

  hideEditBoxIcons: ->
    span = $('#edit-boxes').find('span')
    $(".edit-box-icons").hide()
    span.html('EDIT BOXES')

  editBoxEvents: ->
    @removeBox()
    @setURL()

  removeBox: ->
    self = @
    $('.remove-box-icon').on 'click', ->
      if confirm('Do you really want destroy this box?')
        box = $(this).parents('.box')
        boxId = box.attr('id').split('-').pop()
        url = "/boxes/#{boxId}"
        $.ajax({url: url, type: 'delete'}).success (result) =>
          box.remove()
      else
        return false

  setURL: ->
    self = @
    $('.set-url-icon').on 'click', (e)->
      e.preventDefault()
      box = $(this).parents('.box')
      boxId = box.attr('id').split('-').pop()
      ajaxLink = "/boxes/#{boxId}/select_url"
      $.get(ajaxLink).success =>
        $('#editBoxesModal').modal('show')

  rearrangedBoxes: ->
    self = @
    $('#edit-boxes').on 'click', ->
      if not $(".edit-box-icons").is(":visible")
        $container = $('#box-container')
        $boxes = $('.box').not('.new-box')
        boxesJson = {}

        i = 0
        while i < $boxes.length
          $box = $($boxes[i])
          boxesJson[i] =  self.boxJson($box)
          i+=1
        boxesJson = {boxes: boxesJson}

        ajaxLink = "/boxes/update_positions"
        #$.update(ajaxLink).success =>

        $.ajax({
          url: ajaxLink,
          type: "PUT",
          contentType: 'application/json',
          data: JSON.stringify(boxesJson)
          dataType: 'json'
        })

  boxJson: (box)->
      id = box.attr('id').split('-').pop()
      position = box.index()
      hash = {id: id, position: position}
