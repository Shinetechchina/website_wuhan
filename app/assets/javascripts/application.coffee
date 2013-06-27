#= require jquery
#= require jquery_ujs
#= require jquery.isotope.min
#= require path.min
#= require box_manager
#= require_self

# Bind slide event. It's extremely easy so I don't use OO
initSlide = ->
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

  registerPath(url) for url in ['home', 'if_forefront', 'services', 'references', 'frontiers', 'blog']

  Path.root('#/home')

  Path.listen()

  initSlide()
