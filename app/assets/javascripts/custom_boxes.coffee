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
    span = $('#edit-boxes').find('span')
    spanText = span.html()
    $('#edit-boxes').on 'click', ->
      if $(".icon-remove-sign").length == 0
        span.html 'UPDATE'
        $(".box").not('.new-box').prepend('<i class="icon-remove-sign remove-box-icon"></i>')
        self.removeBox()
      else
        if span.html() == 'UPDATE'
          $('.remove-box-icon').hide()
          span.html(spanText)
        else
          $('.remove-box-icon').show()
          span.html('UPDATE')

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
