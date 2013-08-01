App.Router =
  elMenu: null

  pageFirstLoaded: true

  init: ->
    @elMenu = $('#menu')

    @registerRoute '/'
    @registerRoute '/services'
    @registerRoute '/clients'
    @registerRoute '/technologies'
    @registerRoute '/staff'
    @registerRoute '/blog'

    Path.history.listen()

    @bindLinks()

  registerRoute: (route) ->
    self = @

    Path.map(route).enter(->
      self.activeMenuItem(route)
    ).to(->
      if self.pageFirstLoaded
        self.pageFirstLoaded = false
      else
        App.BoxManager.load(route)
    )

  bindLinks: ->
    $('body').on 'click.route', 'a.route', (e) ->
      e.preventDefault()
      el = $(@)
      Path.history.pushState({}, "", el.attr('href')) if el.attr('href')

  activeMenuItem: (route) ->
    @elMenu
      .find('li').removeClass('selected').end()
      .find('li').each ->
        li = $(@)
        li.addClass('selected') if li.find('a').attr('href') == route
