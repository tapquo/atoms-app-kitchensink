"use strict"

class List extends Atoms.Organism.Article

  # @scaffold "source/organisms/list.json"

  render: ->
    super
    do @onLoadContacts

  # Children Bubble Events
  onSearchChange: (event, search) ->
    value = search.value()
    if value
      @binding.list.select (entity) -> entity if entity.name.indexOf(value) > -1
    else
      @binding.list.all()

  onSearchSubmit: (event, search) ->
    @binding.list.findBy "name", search.value()

  # Children Bubble Events with Custom Callbacks
  onSectionScroll: (event, section) ->
    super
    # console.log "onSectionScroll", event
    # @tunnel "onSectionScroll", event
    # false

  onSectionPull: (event, section) ->
    setTimeout ->
      section.refresh()
    , 3500

  onListSelect: (atom, dispatcher, hierarchy...) ->
    attributes = atom.entity.attributes()
    if attributes.url?
      attributes.url = undefined
    else
      attributes.url  = "http://cdn.tapquo.com/photos/cata.jpg"
      attributes.description = new Date().toString()[0...28]
    atom.entity = atom.entity.updateAttributes attributes
    false

  onLiSwipeleft: -> console.log "onLiSwipeleft"

  onLiHold: -> console.log "onLiHold"

  onLiDoubleTap: -> console.log "onLiDoubleTap"

  onContactDelete: (event, atom) ->
    atom.entity.destroy()
    false

  onLoadContacts: ->
    @search.value ""
    # Example of Async Process Render with Entity
    # entity = Atoms.Entity.User
    entity = __.Entity.User
    entity.create name: "Javi Jiménez Villar", when: "10/04/1980", url: "http://cdn.tapquo.com/photos/soyjavi.jpg"
    entity.create name: "Mock Data", style: "anchor"
    entity.create name: "Name #{i}" for i in [1..10]
    # @manual.list.entity entity.all()

    setTimeout =>
      __.Entity.User.findBy("name", "Javi Jiménez Villar")?.updateAttributes
        name: "Javitxu"
      __.Entity.User.findBy("name", "Name 1")?.updateAttributes
        name: "Catilla"
    , 1000

    # setTimeout =>
    #   @binding.list.destroyChildren()
    #   console.log __.Entity.User.all()
    # , 1000


list = new List(null, "../source/organisms/list.json");
