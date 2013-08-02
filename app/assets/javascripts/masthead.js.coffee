App.Masthead =
  el: null

  headerHeight: 70
  mastheadHeight: 254
  contentMargin: 20

  init: ->
    @el = $('.masthead')
    @bindEvents()

  hide: ->
    @el.fadeOut()
    $('#box-container').animate(opacity: 1, 700)

  bindEvents: ->
    $('.logo a').on 'click', (e) => @toggleHeader()

  toggleHeader: (e) ->
    e.preventDefault() if e
    if @el.height() == 0
      @expandHeader()
    else
      @collapseHeader()

  expandHeader: ->
    @el.animate {height: @mastheadHeight}, step: (height) =>
      $('.header').css('margin-top', height + 'px')
      $('#box-container').css('margin-top', height + @headerHeight + 20)

  collapseHeader: ->
    @el.animate {height: 0}, step: (height) =>
      $('.header').css('margin-top', height + 'px')
      $('#box-container').css('margin-top', height + @headerHeight + 20)
