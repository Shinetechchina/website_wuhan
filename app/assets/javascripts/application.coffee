#= require jquery
#= require jquery_ujs
#= require jquery.cookie
#= require bootstrap-dropdown
#= require bootstrap-modal
#= require bootstrap-carousel
#= require jquery.tagsinput
#
# require masonry.pkgd.min
#= require jquery-ui-1.10.3.custom
#= require shapeshift/jquery.shapeshift
#= require signals.min
#= require crossroads.min
#= require_self
#= require box_manager
#= require router
#= require staff
#= require dropdown_tag_list
#= require video_modal
#= require overlay
#= require masthead
#= require custom_boxes
#= require ga

window.App = App =
  $menu: null

  init: ->
    App.BoxManager.init()
    App.CustomBoxes.init()
    App.Router.init()
    App.Staff.init()
    App.DropdownTagList.init()
    App.Masthead.init()

    @initSlide()
    @initGuest()
    @initMessage()
    @initCookieNotice()

  initMenu: ->

  initMessage: ->
     $("#message_container").slideDown().delay(5000).slideUp()

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

  initCookieNotice: ->
    #cookie can not set its value to boolean, so I set it with string "true", do not change it to boolean value true.
    if $.cookie("firstAccess") != "true"
      $('#message_container').html('<div class="alert alert-success">Our site uses your cookies for analytics and improve user experiences.</div>')
      @initMessage()
      $.cookie("firstAccess", "true")

$ ->
  App.init()
