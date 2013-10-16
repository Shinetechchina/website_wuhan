App.Masthead =
  el: null
  wheelCount: 0

  headerHeight: 70
  mastheadHeight: 180
  contentMargin: 20
  stopFlag: false

  init: ->
    @el = $('.masthead')
    #@bindEvents()
    @doubleTopBrowser()
    @cancelShowByMouseWheel()

  hide: ->
    @el.fadeOut()
    $('#box-container').animate(opacity: 1, 700)

  cancelShowByMouseWheel: ->
    self = @
    @el.find('.icon-remove').on 'click', ->
      self.collapseHeader()
      self.stopFlag = true

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
    @el.slideUp('', ->scroll('', 0))
    height = 0
    $('.header').css('margin-top', height + 'px')
    $('#box-container').css('margin-top', height + @headerHeight + 20)

  doubleTopBrowser: ->
    self = @
    #show header info
    $(window).on 'mousewheel', ->
      self.showHeaderByWheel()
    $(window).on 'wheel', ->
      self.showHeaderByWheel()
    #hide header info
    $(window).scroll ->
      if self.el.is(":visible") and scrollY > 0
        self.collapseHeader()
        self.wheelCount = 0

  showHeaderByWheel: ()->
    if scrollY == 0 and not @el.is(":visible") and !@stopFlag
      # record wheel count
      @wheelCount = @wheelCount + 1
      if @wheelCount == 6
        @wheelCount = 0
        self = @
        setTimeout(->
          setTimeout(->
            self.collapseHeader()
          , 5000)
          self.expandHeader()
        , 0)
