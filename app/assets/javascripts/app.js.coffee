window.App = App =
  $menu: null

  init: ->
    App.BoxManager.init()
    App.Router.init()

    @initSlide()
    @initTagList()
    @submitNavbarTagsInput()

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

  initTagList: ->
    $('.dropdown-tag .dropdown-menu a').on 'onselectstart', ->
      return false
      #forbid select text in IE6--IE9

    $('.dropdown-tag .dropdown-menu a').on 'click', (e) ->
      if $(this).hasClass('option-all') and not $(this).find('i').hasClass('selected')
        $('.dropdown-tag .dropdown-menu .selected').removeClass('selected')
        $(this).find('i').addClass('selected')
      else
        $(this).find('i').toggleClass('selected')
        $('.dropdown-tag .dropdown-menu .option-all i').removeClass('selected')
      return false

  submitNavbarTagsInput: ->
    $('.nav-btn').on 'click', (e) ->
      SelectedValues = window.App.getNavbarSelectedTags()
      $.cookie('tag', SelectedValues)
      location.reload()

  getNavbarSelectedTags: ->
    $('.dropdown-menu li a .selected').parents('a').text().split(" ").filter (v) ->
      v isnt ""
