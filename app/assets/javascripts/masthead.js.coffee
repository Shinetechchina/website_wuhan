App.Masthead =
  el: null
  wheelCount: 0

  headerHeight: 70
  mastheadHeight: 254
  contentMargin: 20

  init: ->
    @el = $('.masthead')
    @bindEvents()
    @doubleTopBrowser()

  hide: ->
    @el.fadeOut()
    $('#box-container').animate(opacity: 1, 700)

  bindEvents: ->
    $('.logo a').on 'click', (e) => @toggleHeader()

  toggleHeader: (e) ->
    e.preventDefault() if e
    if @el.is(":visible")
      @collapseHeader()
    else
      @expandHeader()

  expandHeader: ->
    @el.slideDown()
    height = @mastheadHeight
    $('.header').css('margin-top', height + 'px')
    $('#box-container').css('margin-top', height + @headerHeight + 20)

  collapseHeader: (e)->
    @el.slideUp()
    height = 0
    $('.header').css('margin-top', height + 'px')
    $('#box-container').css('margin-top', height + @headerHeight + 20)

  doubleTopBrowser: ->
    self = @

    $(window).on 'mousewheel', (e)->
      self.toggleHeaderByWheel()
    $(window).on 'wheel', (e)->
      self.toggleHeaderByWheel()

  toggleHeaderByWheel: ()->
      if scrollY == 0 and not @el.is(":visible")
        # record wheel count
        @wheelCount = @wheelCount + 1
        if @wheelCount == 5
          @expandHeader()
          @wheelCount = 0

      else if scrollY > 40 and @el.is(":visible")
        @collapseHeader()

      if scrollY > 0 and @wheelCount > 0
        # clear wheel num
        @wheelCount = 0
