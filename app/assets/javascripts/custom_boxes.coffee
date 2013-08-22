App.CustomBoxes =

  init: ->
    @selectBoxableType()
    @toggleEditBoxIcons()

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
      if $('.box-404').length > 0
        alert('Can not edit boxes in 404 page')
      else
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

  hideEditBoxIcons: ->
    span = $('#edit-boxes').find('span')
    $(".edit-box-icons").hide()
    span.html('EDIT BOXES')

  editBoxEvents: ->
    @removeBox()
    @setURL()

  removeBox: ->
    $('.remove-box-icon').on 'click', ->
      if confirm('Do you really want destroy this box?')
        box = $(this).parents('.box')
        boxId = box.attr('id').split('-').pop()
        url = "/boxes/#{boxId}"
        $.ajax({url: url, type: 'delete'}).success (result) =>
          box.remove()
          App.BoxManager.init()
      else
        return false

  setURL: ->
    $('.set-url-icon').on 'click', ->
      box = $(this).parents('.box')
      oldURL = box.attr('href')
      if newURL = prompt('Please input link, it use to redirct to other page after user click the box.', oldURL)
        boxId = box.attr('id').split('-').pop()
        ajaxLink = "/boxes/#{boxId}/set_url?url=#{newURL}"
        $.ajax({url: ajaxLink, type: 'put'}).success =>
          App.Router.reload()
