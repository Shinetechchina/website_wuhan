App.DropdownTagList =

  init: ->

    self = @
    @$dropdownMenu = $('.dropdown-tag .dropdown-menu')
    @$dropdownMenuLink = $('.dropdown-tag .dropdown-menu a')

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

    #submit tag list
    $('.nav-btn').on 'click', (e) ->
      SelectedValues = self.getNavbarSelectedTags()
      $.cookie('tag', SelectedValues)
      location.reload()

  getNavbarSelectedTags: ->
    @$dropdownMenu.find('.selected').text().split(" ").filter (v) ->
      v isnt ""
