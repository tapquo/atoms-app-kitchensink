"use strict"

class List extends Atoms.Organism.Article

  @url = "assets/scaffolds/article.list.json"

  render: ->
    super
    new Atoms.Molecule.ListExtended container: @el.find "#extended"
    do @onLoadContacts

  # -- Children Bubble Events --------------------------------------------------
  onSearchChange: (event, search) ->
    value = search.value()
    if value
      @main.list.select (entity) -> entity if entity.name.indexOf(value) > -1
    else
      @main.list.all()

  onSearchSubmit: (event, search) ->
    @main.list.findBy "name", search.value()

  onSectionScroll: (event, section) ->
    super
    console.log "onSectionScroll", event
    false

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
    entity = __.Entity.User
    entity.create name: ".thumb style", style: "anchor"
    entity.create name: "Javi Jiménez Villar", style: "thumb", when: "10/04/1980", url: "http://cdn.tapquo.com/photos/soyjavi.jpg"
    entity.create name: "Catalina Oyaneder", style: "thumb", when: "26/03/1980", url: "http://cdn.tapquo.com/photos/cata.jpg"
    entity.create name: "Oihane Merino", when: "26/03/1980", url: "http://cdn.tapquo.com/photos/oihane.jpg"
    entity.create name: "Mock Data", style: "anchor"
    entity.create name: "Name #{i}" for i in [1..10]
    @manual.list.entity entity.all()

    setTimeout =>
      __.Entity.User.findBy("name", "Javi Jiménez Villar")?.updateAttributes
        name: "Javitxu"
      __.Entity.User.findBy("name", "Name 1")?.updateAttributes
        name: "Catilla"
    , 1000

list = new List()
