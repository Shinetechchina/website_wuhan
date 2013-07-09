App.VideoModal =
  show: (opts = {}) ->
    App.Overlay.show()

    modal = @_getOrCreateModal()
    iframe = $("<iframe width=\"853\" height=\"480\" frameborder=\"0\" allowfullscreen></iframe>")
    modal.find('.video-modal-content').html('').append(iframe)
    iframe.attr('src', "#{opts.url}?autoplay=1&showinfo=0")
    modal.show()
    @

  hide: ->
    modal = @_getOrCreateModal()
    modal.find('.video-modal-content').html('')
    modal.hide()
    App.Overlay.hide()
    @

  _getOrCreateModal: ->
    modal = $('.video-modal')

    unless modal[0]
      modal = $(
        '<div class="video-modal">
          <a class="btn-close icon-stack icon-2x">
            <i class="icon-circle icon-dark icon-stack-base"></i>
            <i class="icon-remove icon-light"></i>
          </a>
          <div class="video-modal-content"></div>
        </div>'
      ).appendTo(document.body)
      modal.find('.btn-close').on 'click', => @hide()

    modal
