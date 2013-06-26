window.boxManager =
  init: ->
    self = @

    @$container = $('.box-container')

    @$container.isotope
      itemSelector: '.box'

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

    $.get(url).success (result) ->
      html = $(result)
      html.filter('.box').each -> $container.isotope('insert', $(@))

      # $container.html(result)
      # $container.isotope('reloadItems')
      # self.reLayout()
