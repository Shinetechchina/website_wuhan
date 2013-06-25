$ ->
  $('.box').on 'mouseover', ()->
    $(this).children('.show-more-link').slideDown()

  $('.box').on 'mouseleave', ()->
    $(this).children('.show-more-link').slideUp()
