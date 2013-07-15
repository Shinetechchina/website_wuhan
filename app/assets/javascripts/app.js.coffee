window.App = App =
  $menu: null

  init: ->
    @boxManager = boxManager
    boxManager.init()

    @initSlide()
    @initRoutes()

  initMenu: ->

  initSlide: ->
    $(document.body).on 'click', '.slide .tabs li, .slide .bullets li', ->
      el = $(@)
      return if el.hasClass('active')

      idx = el.index()

      slide = el.parents('.slide:first')
      slide.find('.tabs .active, .bullets .active').removeClass('active')
      slide.find(".tabs li:eq(#{idx})").addClass('active')
      slide.find(".bullets li:eq(#{idx})").addClass('active')

      currentContent = slide.find('.tab-content.active')
      activeContent = slide.find(".tab-content:eq(#{idx})")

      currentContent.addClass('slide-out').removeClass('active')
      activeContent.addClass('active')
      setTimeout(->
        currentContent.removeClass('slide-out')
      , 500)

  initRoutes: ->
    self = @
    registerPath = (url) ->
      Path.map("##{url}(/:tag)").to(->
        if @params.tag
          boxManager.load("#{url}?tag=#{@params.tag}")
        else
          boxManager.load("#{url}")
      ).enter ->
        self.activeMenuItem(url)

    @$menu = $('#menu')
    @$menu.find('li a').each ->
      el = $(@)
      registerPath $(@).attr('href')
      el.attr 'href', el.attr('href').replace(/^\//, '/#/')

    Path.root('#/home')

    Path.listen()

  activeMenuItem: (url) ->
    @$menu
      .find('li').removeClass('selected').end()
      .find('li').each ->
        li = $(@)
        li.addClass('selected') if li.find('a').attr('href') == "/##{url}"
