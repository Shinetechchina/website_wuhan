App.DropdownTagList =

  init: ->
    @$dropdownMenu = $('.dropdown-tag .dropdown-menu')
    @$dropdownMenuLink = $('.dropdown-tag .dropdown-menu a')
    @setTagListBar()
    @initTagListSelected()
    @initTagListMenu()
    @initTagListSubmit()

  initTagListMenu: ->
    self = @

    #forbid select text in IE6--IE9
    @$dropdownMenu.on 'onselectstart', 'a', (e) -> e.preventDefault

    @$dropdownMenu.on 'click', 'a', ->
      elLink = $(@)
      if (elLink.data('tag') == '') and not elLink.hasClass('selected')
        self.$dropdownMenu.find('.selected').removeClass('selected')
        elLink.addClass('selected')
      else
        elLink.toggleClass('selected')
        self.$dropdownMenu.find('[data-tag=""]').removeClass('selected')
      return false

  initTagListSelected: ->
    tags = @getTags()
    if tags
      @$dropdownMenuLink.each ->
        elLink = $(@)
        elLink.addClass('selected') if $.inArray(elLink.data('tag'), tags) >= 0
    else
      @$dropdownMenuLink.filter(':first').addClass('selected')


  initTagListSubmit: ->
    self = @
    $('.nav-btn').on 'click', (e) ->
      self.setCookieTags()
      self.setTagListBar()
      location.reload()

  setCookieTags: ->
    selectedValues = @getNavbarSelectedTags()
    $.cookie('tag', selectedValues)

  getTags: ->
    tags = $.cookie('tag')
    if tags then tags.split(',') else null

  setTagListBar: ->
    tags = @getTags()
    tag_text = if tags then tags.join(' + ') else 'all'
    $('.dropdown-tag .dropdown-toggle span').text(tag_text)

  getNavbarSelectedTags: ->
    selectedValues = []
    for selected in @$dropdownMenu.find('.selected')
      selectedValues = selectedValues.concat($(selected).data('tag'))
    selectedValues
