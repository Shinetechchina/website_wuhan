window.boxManager =
  init: ->
    self = @

    @$container = $('.box-container')

    @$container.isotope
      itemSelector: '.item'

    @$container.on 'click', '.box-expandable', ->
      self.expandBox(@)

    @initBoxVideo()

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

    App.Overlay.show(mask: true)

    $.get(url).success (result) ->
      App.Overlay.hide()

      $container
        .isotope('remove', $container.find('.item'))
        .isotope('insert', $(result).filter('.item'))

      $container.find('.box-video').each ->
        el = $(@)
        if el.data('video-id')
          el.css('background-image', "url(http://img.youtube.com/vi/#{el.data('video-id')}/hqdefault.jpg)")

  initBoxVideo: ->
    self = @
    $(document.body).on 'click', '.box-video .btn-play', ->
      box = $(@).parents('.box-video:first')
      App.VideoModal.show(videoId: box.data('video-id'))
