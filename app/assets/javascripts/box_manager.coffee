window.boxManager =
  init: ->
    self = @

    @$container = $('#box-container')

    @$container.masonry
      itemSelector: '.box'
      columnWidth: 279
      gutter: 18

    @$container.on 'click', '.box-expandable', ->
      self.expandBox(@)

    @initBoxVideo()

  # 展开box，只有class为box-expandable的box才会响应这个方法
  expandBox: (el) ->
    $el = $(el)
    expandedClass = $el.data('expanded-class')
    return if $el.hasClass('box-expanded')

    @$container.find(".box-expandable").removeClass('box-expanded') #.removeClass(expandedClass)
    $el.addClass('box-expanded') #.addClass(expandedClass)

    onLayoutComplete = ->
      $(document.body).animate scrollTop: $el.offset().top - 40
      true

    @reLayout()
    @$container.masonry 'on', 'layoutComplete', onLayoutComplete

  reLayout: ->
    @$container.masonry('layout')

  load: (url) ->
    self = @
    $container = @$container

    App.Overlay.show(mask: true)

    $.get(url).success (result) ->
      App.Overlay.hide()

      # Remove old boxes when page changing
      boxes = $container.children()
      $container.masonry('remove', boxes).masonry('layout') if (boxes[0])

      # new boxes must be add one by one, or Masonry will calculate box container height wrong
      $(result).filter('.box').each ->
        $container.append(@)
        $container.masonry('appended', @)

      $container.find('.box-video').each ->
        el = $(@)
        if el.data('video-id')
          el.css('background-image', "url(http://img.youtube.com/vi/#{el.data('video-id')}/hqdefault.jpg)")

  initBoxVideo: ->
    self = @
    $(document.body).on 'click', '.box-video .btn-play', ->
      box = $(@).parents('.box-video:first')
      App.VideoModal.show(videoId: box.data('video-id'))
