window.boxManager =
  init: ->
    self = @

    @$container = $('.box-container')

    @$container.isotope
      itemSelector: '.item'

    @$container.on 'click', '.box-expandable', ->
      self.expandBox(@)

  # 展开box，只有class为box-expandable的box才会响应这个方法
  expandBox: (el) ->
    $el = $(el)
    return if $el.hasClass('box-expanded')

    @$container.find('.box-expanded').removeClass('box-expanded')
    $el.toggleClass('box-expanded')

    @reLayout()

  reLayout: ->
    @$container.isotope('reLayout')

  load: (url) ->
    self = @
    $container = @$container

    @showLoading()
    $.get(url).success (result) ->
      self.hideLoading()
      $container
        .isotope('remove', $container.find('.item'))
        .isotope('insert', $(result).filter('.item'))

  showLoading: ->
    $('.loading').fadeIn()

  hideLoading: ->
    $('.loading').fadeOut()
