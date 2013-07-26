App.DropdownTagList =

  init: ->
    @$dropdownMenu = $('.dropdown-tag .dropdown-menu')
    @$dropdownMenuLink = $('.dropdown-tag .dropdown-menu a')
    @setTagListBar()
    @initTagListMenu()
    @initTagListSubmit()

  initTagListMenu: ->
    self = @

    @$dropdownMenuLink.on 'onselectstart', (e)->
      e.preventDefault
      #forbid select text in IE6--IE9

    @$dropdownMenuLink.on 'click', ->
      if $(@).hasClass('option-all') and not $(@).hasClass('selected')
        self.$dropdownMenu.find('.selected').removeClass('selected')
        $(@).addClass('selected')
      else
        $(@).toggleClass('selected')
        self.$dropdownMenu.find('.option-all').removeClass('selected')
      return false

  initTagListSubmit: ->
    self = @
    $('.nav-btn').on 'click', (e) ->
      self.setCookieTags()
      self.setTagListBar()
      location.reload()

  setCookieTags: ->
    self = @
    selectedValues = self.getNavbarSelectedTags()
    selectedValues = 'all' if selectedValues.length == 0
    $.cookie('tag', selectedValues)

  setTagListBar: ->
    tag_text = $.cookie('tag').split(',').join(' + ')
    $('.dropdown-tag .dropdown-toggle span').text(tag_text)

  getNavbarSelectedTags: ->
    @$dropdownMenu.find('.selected').text().split(" ").filter (v) ->
      v isnt ""
