App.Router =
  elMenu: null

  currentPage: null

  init: ->
    @elMenu = $('#menu')

    @currentPage = location.pathname.match(/^(\/\w*)/)[1]

    pageRoute = crossroads.addRoute '/:page:/:id:'

    onRouteChange = (page, id) =>
      page = if page then "/#{page}" else '/'

      @activeMenuItem(page)
      if @currentPage == page
        App.BoxManager.expandBox(id)
      else
        @currentPage = page
        App.BoxManager.load(page, id)

    pageRoute.matched.add(onRouteChange)

    @bindEvents()

  bindEvents: ->
    return unless Modernizr.history

    $('body').on 'click.route', 'a.route', (e) ->
      e.preventDefault()
      el = $(@)
      url = el.attr('href')
      crossroads.parse(url)
      history.pushState(null, null, url) if url

    $(window).on 'popstate', ->
      crossroads.parse(location.pathname)

  activeMenuItem: (route) ->
    @elMenu
      .find('li').removeClass('selected').end()
      .find('li').each ->
        li = $(@)
        li.addClass('selected') if li.find('a').attr('href') == route
