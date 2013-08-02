window.App = App =
  $menu: null

  init: ->
    App.BoxManager.init()
    App.Router.init()
    App.DropdownTagList.init()
    App.Masthead.init()

    @initSlide()
    @initGuest()

  initMenu: ->

  initSlide: ->
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

      # TODO 把这个变成 layout 后的回调，layout 计算完成后立刻执行
      setTimeout(->
        currentContent.removeClass('slide-out')
      , 500)

  initGuest: ->
    $('#guest-bar').on 'click', ->
      if !$('#guest-form').is(':visible')
        $('#guest-form').show()
        $(@).find('i').removeClass('.icon-chevron-up').addClass('icon-chevron-down')
      else
        $('#guest-form').hide()
        $(@).find('i').addClass('.icon-chevron-up').removeClass('icon-chevron-down')
