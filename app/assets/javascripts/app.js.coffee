window.App = App =
  $menu: null

  init: ->
    App.BoxManager.init()
    App.Router.init()

    @initSlide()
    @initTagList()
    @initTagsInput()

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
      setTimeout(->
        currentContent.removeClass('slide-out')
      , 500)

  initTagList: ->
    $('.dropdown-tag .dropdown-menu a').on 'click', (e) ->
      seletedValue = $(this).text()
      navbarTagsValues = $('#navbar-tags_tagsinput .tag span').text().split("  ")

      e.preventDefault()
      if $.inArray(seletedValue, navbarTagsValues) < 0
        $('#navbar-tags').addTag(seletedValue)
      else
        $('#navbar-tags').removeTag(seletedValue)
      #el = $(@)
      #$.cookie('tag', el.data('tag'))
      #location.reload()


  initTagsInput: ->
    $('.tags-input').tagsInput
      height: "51px"
      interactive: false

  submitNavbarTagsInput: ->
    $('.nav-btn').onclick ->
      navbarTagsValues = $('#navbar-tags_tagsinput .tag span').text().split("  ")
      $.cookie('tag', el.data(navbarTagsValues.join(',')))
      location.reload()
