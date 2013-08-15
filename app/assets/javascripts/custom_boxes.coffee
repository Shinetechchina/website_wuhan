App.CustomBoxes =

  init: ->
    @selectBoxableType()
    @toggleBoxRemoveButton()

  selectBoxableType: ->
    $('#box_boxable_type').on 'change', ->
      url = '/boxes/select_type'
      $.post(url + "?boxable_type=" + $(this).val()).success (result) ->
        $('#box_boxable_id').html(result)

  toggleBoxRemoveButton: ->
    self = @
    $('#edit-boxes').on 'click', ->
      span = $(this).find('span')

      if $(".icon-remove-sign").length == 0
        span.html 'CANCEL'
        $(".box").not('.new-box').prepend('<i class="icon-remove-sign remove-box-icon"></i>')
        self.removeBox()
      else
        if span.html() == 'CANCEL'
          $('.remove-box-icon').hide()
          span.html('EDIT')
        else
          $('.remove-box-icon').show()
          span.html('CANCEL')

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
