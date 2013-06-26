#= require jquery
#= require jquery_ujs
#= require jquery.isotope.min
#= require path.min
#= require box_manager
#= require responsiveslides.min
#= require_self

$ ->
  boxManager.init()

  registerPath = (url) ->
    Path.map("#/#{url}").to -> boxManager.load("/#{url}")

  registerPath(url) for url in ['home', 'if_forefront', 'services', 'references', 'frontiers', 'blog']

  Path.root('#/home')

  Path.listen()
