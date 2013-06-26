#= require jquery
#= require jquery_ujs
#= require jquery.isotope.min
#= require path.min
#= require box_manager
#= require_self

$ ->
  boxManager.init()

  Path.map('#/home').to ->
    boxManager.load('/home')

  Path.root('#/home')

  Path.listen()
