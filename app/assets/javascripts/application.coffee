#= require jquery
#= require jquery_ujs
#= require jquery.isotope.min
#= require path.min
#= require box_manager
#= require responsiveslides.min
#= require_self

$ ->
  boxManager.init()

  # TODO refactor after finishing functionalities
  activeCurrentNavItem = (url) ->
    nav = $('.nav ul')
    nav.find('li').removeClass('active')
    nav.find('li').each ->
      li = $(@)
      li.addClass('active') if li.find('a').attr('href') == "/#/#{url}"

  registerPath = (url) ->
    Path.map("#/#{url}").to(->
      boxManager.load("/#{url}")
    ).enter ->
      activeCurrentNavItem(url)

  registerPath(url) for url in ['home', 'if_forefront', 'references', 'services', 'frontiers', 'blog']

  Path.root('#/home')

  Path.listen()
