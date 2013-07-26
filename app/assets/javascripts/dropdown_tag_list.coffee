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

    @$dropdownMenuLink.on 'onselectstart', (e)->
      e.preventDefault
      #forbid select text in IE6--IE9

    @$dropdownMenuLink.on 'click', ->
      if ($(@).data('tag') == '') and not $(@).hasClass('selected')
        self.$dropdownMenu.find('.selected').removeClass('selected')
        $(@).addClass('selected')
      else
        $(@).toggleClass('selected')
        self.$dropdownMenu.find('[data-tag=""]').removeClass('selected')
      return false

  initTagListSelected: ->
    cookie_tags = $.cookie('tag').split(',')
    for link in @$dropdownMenuLink
      if $.inArray( $(link).data('tag'), cookie_tags ) is 0
        $(link).addClass('selected')

  initTagListSubmit: ->
    self = @
    $('.nav-btn').on 'click', (e) ->
      self.setCookieTags()
      self.setTagListBar()
      location.reload()

  setCookieTags: ->
    selectedValues = @getNavbarSelectedTags()
    $.cookie('tag', selectedValues)

  setTagListBar: ->
    tag_text = $.cookie('tag').split(',').join(' + ')
    tag_text = 'all' if tag_text == ''
    $('.dropdown-tag .dropdown-toggle span').text(tag_text)

  getNavbarSelectedTags: ->
    selectedValues = []
    for selected in @$dropdownMenu.find('.selected')
      selectedValues = selectedValues.concat($(selected).data('tag'))
    selectedValues
