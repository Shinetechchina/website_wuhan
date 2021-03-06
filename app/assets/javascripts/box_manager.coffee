App.BoxManager =
  currentPage: null

  boxWidth: 280
  boxHeight: 288
  gutter: 20

  init: ->
    @$container = $('#box-container')
    @currentPage = location.pathname.match(/^(\/\w*)/)[1]
    @shapeshiftEnableDrag(false)
    @bindEvents()

  shapeshiftEnableDrag: (boolean)->
    @$container.shapeshift
      colWidth: @boxWidth
      #columns: 4
      animationSpeed: 400
      gutterX: @gutter
      gutterY: @gutter
      paddingX: 0
      paddingY: 0
      align: 'left'
      enableDrag: boolean

  bindEvents: ->
    self = @
    @$container.on 'click', '.box.box-expandable:not(a)', -> self.expandBox(@)

  countExpandHeight: (height)->
    heightInt = parseInt(height)
    if heightInt > @boxHeight and heightInt < @boxHeight * 2 + @gutter
      (@boxHeight * 2 + @gutter) + 'px'

  # 展开box，只有class为box-expandable的box才会响应这个方法
  expandBox: (el) ->
    $el = if typeof el == 'string' then @$container.find(".box[data-box-id=#{el}]") else $(el)
    trackAccessBox($el)
    return if $el.is('a')
    expandCols = $el.data('expand-cols')
    return if $el.hasClass('box-expanded')

    @$container.find(".box-expandable:not([data-collapse=false])").removeClass('box-expanded').removeAttr('data-ss-colspan')
    $el.addClass('box-expanded')
    if parseInt($('body').css('width')) >= 596
      $el.attr('data-ss-colspan', expandCols)

    # onLayoutComplete = ->
    #   $(document.body).animate scrollTop: $el.offset().top - parseInt($('#box-container').css('margin-top').replace('px', ''))
    #   true
    @reLayout()
    # @$container.masonry 'on', 'layoutComplete', onLayoutComplete

  reLayout: ->
    @$container.trigger('ss-rearrange')

  # The usage of reload:
  #   When calling render() without reload, if the current page is not change, BoxManager won't reload boxes from server.
  #   With reload, BoxManager loads all the boxes from server.
  #   Currently only tag switching needs this argument.
  render: (page, reload) ->
    $container = @$container

    if @currentPage != page || reload
      @currentPage = page
      App.Overlay.show(mask: true) if page.match(/^\/blog/)

      $.get(page).success (result) =>
        App.Overlay.hide()

        # Remove old boxes when page changing
        boxes = @$container.children()
        @$container.html(result)
        @reLayout()

        # $container.find('.box-video').each ->
        #   el = $(@)
        #   if el.data('video-id')
        #     el.css('background-image', "url(http://img.youtube.com/vi/#{el.data('video-id')}/hqdefault.jpg)")

  # initBoxVideo: ->
  #   self = @
  #   $(document.body).on 'click', '.box-video .btn-play', ->
  #     box = $(@).parents('.box-video:first')
  #     App.VideoModal.show(videoId: box.data('video-id'))
