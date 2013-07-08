window.App = App =
  $menu: null

  init: ->
    @boxManager = boxManager
    boxManager.init()
    @initMenu()
    @initSlide()
    @initRoutes()

  initMenu: ->
    @$menu = $('#menu')
    @$menu.find('li a').each -> $(@).attr 'href', $(@).attr('href').replace(/^\//, '/#/')

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
      Path.map("#/#{url}").to(->
        boxManager.load("/#{url}")
      ).enter ->
        self.activeMenuItem(url)

    # TODO calculate urls from database or from menu html
    registerPath(url) for url in ['home', 'company', 'services', 'references', 'staff', 'blog']

    Path.root('#/home')

    Path.listen()

  activeMenuItem: (url) ->
    @$menu
      .find('li').removeClass('selected').end()
      .find('li').each ->
        li = $(@)
        li.addClass('selected') if li.find('a').attr('href') == "/#/#{url}"

  showLoading: ->
    $('.loading').fadeIn()

  hideLoading: ->
    $('.loading').fadeOut()
