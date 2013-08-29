App.Router =
  elMenu: null

  init: ->
    @elMenu = $('#menu')
    @initRoutes()
    @bindEvents()

  initRoutes: ->
    pageRoute = crossroads.addRoute '/:page*:'

    trackUtmParameter()
    onRouteChange = (reload, page) =>
      page = if page then "/#{page}" else '/'
      [page, hashtag] = page.split('#')

      trackAccessPage(page.replace(/\//, ''))
      @activeMenuItem(page)
      App.BoxManager.render(page, reload)

    pageRoute.matched.add(onRouteChange)

  bindEvents: ->
    return unless Modernizr.history
    self = @

    $('body').on 'click.route', 'a', (e) ->
      e.preventDefault()
      el = $(@)
      url = el.attr('href')

      if el.hasClass('route')
        crossroads.parse(url, [false])
        App.Masthead.collapseHeader()
        App.CustomBoxes.hideEditBoxIcons()
        # if you want to redirct to back, url is "#back" or "/#back"
        if (url == "#back" or url == "/#back")
          history.back()
          return self.reload()
        else if url
          history.pushState(null, null, url)

      else if url.match(/^#/)
        $.get("/modals/show_by_path", {path: url}).success =>
          $('#linkModal').modal('show')

    $(window).on 'popstate', ->
      crossroads.parse(location.pathname, [false])

  activeMenuItem: (page) ->
    menu = @getMenuByPage(page)
    @elMenu
      .find('li').removeClass('selected').end()
      .find('li').each ->
        li = $(@)
        li.addClass('selected') if li.find('a').attr('href') == "/#{menu}"

  getMenuByPage: (page) ->
    if page == '/'
      return 'home'
    else
      match = page.match(/^\/(\w+)/)
      return if match then match[1] else 'home'

  reload: ->
    # Reset state first, otherwise crossroads won't diapatch for the same url
    crossroads.resetState()
    crossroads.parse(location.pathname, [true])
