App.Staff =
  init: ->
    self = @
    $('body').on 'click', '.box-staff', (e)->
      unless $(e.target).parents('a').length > 0
        self.switchStaff($(this))
      else if $(e.target).parents('.show-staff-details').length == 0
        window.open($(e.target).parents('a').attr('href'))

  switchStaff: (box)->
    if box.find('.maxi').is(":visible")
      @switchMini(box)
    else
      @switchMaxi(box)

  switchMini: (box)->
    box.find('.maxi').slideUp()
    box.find('.mini').slideDown()

  switchMaxi: (box)->
    box.find('.mini').slideUp()
    box.find('.maxi').slideDown()
