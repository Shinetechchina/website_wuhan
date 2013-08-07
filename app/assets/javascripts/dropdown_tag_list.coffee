App.DropdownTagList =
  init: ->
    @$el     = $('.dropdown-tag')
    @$toggle = @$el.find('.dropdown-toggle span')
    @$menu   = @$el.find('.dropdown-menu')
    @$submit = @$el.find('.nav-btn')

    @bindEvents()

    @render()

    @preventMenuSelection()

  bindEvents: ->
    self = @

    @$menu.on 'click', 'a', (e) ->
      e.preventDefault()

      $link = $(@)
      return if $link.hasClass('selected')

      self.setTag($link.data('tag'))
      self.render()

      App.BoxManager.load(location.pathname)

  render: (value) ->
    @$toggle.text(@getTag() || 'all')

    @$menu.find('a').each ->
      $link = $(@)
      if value == $link.data('tag') then $link.addClass('selected') else $link.removeClass('selected')

  # prevent text selection when dbclick in IE6--IE9
  preventMenuSelection: ->
    @$menu.on 'onselectstart', 'a', (e) -> e.preventDefault

  setTag: (value) ->
    $.cookie('tag', value)

  getTag: ->
    tag = $.cookie('tag')
    if tag && !/^\s+$/.test(tag) then tag else null
