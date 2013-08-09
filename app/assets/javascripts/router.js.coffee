App.Router =
  elMenu: null

  init: ->
    @elMenu = $('#menu')
    @initRoutes()
    @bindEvents()

  initRoutes: ->
    pageRoute = crossroads.addRoute '/:page:/:id:'

    window.pageRoute = pageRoute

    # strict pageRoute to respond pages below
    pageRoute.rules =
      page: ['clients', 'services', 'technologies', 'staff', 'blog', 'boxes']

    onRouteChange = (reload, page, id) =>
      page = if page then "/#{page}" else '/'
      @activeMenuItem(page)
      App.BoxManager.render(page, id, reload)

    pageRoute.matched.add(onRouteChange)

  bindEvents: ->
    return unless Modernizr.history

    $('body').on 'click.route', 'a.route', (e) ->
      e.preventDefault()
      el = $(@)
      url = el.attr('href')
      crossroads.parse(url, [false])
      history.pushState(null, null, url) if url

    $(window).on 'popstate', ->
      crossroads.parse(location.pathname, [false])

  activeMenuItem: (route) ->
    @elMenu
      .find('li').removeClass('selected').end()
      .find('li').each ->
        li = $(@)
        li.addClass('selected') if li.find('a').attr('href') == route

  reload: ->
    # Reset state first, otherwise crossroads won't diapatch for the same url
    crossroads.resetState()
    crossroads.parse(location.pathname, [true])
