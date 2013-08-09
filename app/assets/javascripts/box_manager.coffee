App.BoxManager =
  currentPage: null

  init: ->
    self = @

    @$container = $('#box-container')

    @currentPage = location.pathname.match(/^(\/\w*)/)[1]

    @$container.masonry
      itemSelector: '.box'
      columnWidth: 279
      gutter: 18

    @initBoxVideo()

  # 展开box，只有class为box-expandable的box才会响应这个方法
  expandBox: (el) ->
    if typeof el == 'string'
      $el = @$container.find(".box[data-id=#{el}]")
    else
      $el = $(el)
    expandedClass = $el.data('expanded-class')
    return if $el.hasClass('box-expanded')

    @$container.find(".box-expandable").removeClass('box-expanded') #.removeClass(expandedClass)
    $el.addClass('box-expanded') #.addClass(expandedClass)

    # onLayoutComplete = ->
    #   $(document.body).animate scrollTop: $el.offset().top - parseInt($('#box-container').css('margin-top').replace('px', ''))
    #   true

    @reLayout()
    # @$container.masonry 'on', 'layoutComplete', onLayoutComplete

  reLayout: ->
    @$container.masonry('layout')

  # The usage of reload:
  #   When calling render() without reload, if the page is not change, BoxManager only expand the box via id without reload boxes from server.
  #   With reload, BoxManager loads all the boxes from server.
  #   Currently only tag switching needs this argument.
  render: (page, id, reload) ->
    self = @
    $container = @$container

    if @currentPage == page && !reload
      @expandBox(id)
    else
      @currentPage = page
      App.Overlay.show(mask: true) if page == '/blog'

      url = if id then "#{page}/#{id}" else page
      $.get(url).success (result) ->
        App.Overlay.hide()

        # Remove old boxes when page changing
        boxes = $container.children()
        $container.masonry('remove', boxes).masonry('layout') if (boxes[0])

        # new boxes must be add one by one, or Masonry will calculate box container height wrong
        $(result).filter('.box').each ->
          $container.append(@)
          $container.masonry('appended', @)

        # $container.find('.box-video').each ->
        #   el = $(@)
        #   if el.data('video-id')
        #     el.css('background-image', "url(http://img.youtube.com/vi/#{el.data('video-id')}/hqdefault.jpg)")

  initBoxVideo: ->
    self = @
    $(document.body).on 'click', '.box-video .btn-play', ->
      box = $(@).parents('.box-video:first')
      App.VideoModal.show(videoId: box.data('video-id'))
