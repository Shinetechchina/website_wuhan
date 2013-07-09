App.Overlay =
  show: (opts = {}) ->
    el = $('.loading')
    unless el[0]
      el = $('
        <div class="loading hide">
          <div class="loading-mask hide"></div>
        </div>
      ').appendTo(document.body)

    if opts.mask
      el.find('.loading-mask').removeClass('hide')
    else
      el.find('.loading-mask').addClass('hide')

    el.fadeIn()
    @

  hide: ->
    el = $('.loading')
    el.fadeOut()
    @
