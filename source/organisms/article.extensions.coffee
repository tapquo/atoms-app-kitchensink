"use strict"

class Extensions extends Atoms.Organism.Article

  @scaffold "assets/scaffolds/article.extensions.json"

  render: ->
    super
    # -- Carousel
    carousel = @carousel.instance
    carousel.clean()
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/javi.jpg"
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/oihane.jpg"
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/cata.jpg"
    carousel.initialize()

    # -- Calendar
    @calendar.first.setEvent new Date(2014, 10, 15)
    @calendar.first.setEvent new Date(2014, 10, 29)
    @calendar.first.setEvent new Date(2014, 10, 30)
    @calendar.first.setEvent new Date(2014, 10, 31)
    @calendar.first.setEvent new Date(2014, 10, 1)
    @calendar.second.setEvent new Date(1980, 10, 10)
    @calendar.first.removeEvent new Date(2014, 10, 30)
    @calendar.second.setEvent [
      new Date(2014, 10, 14),
      new Date(2014, 10, 16),
      new Date(2014, 10, 17),
      new Date(2014, 10, 18)
    ]
    @calendar.first.refresh
      available: ["2014/10/29", "2014/10/30", "2014/10/31", "2014/09/01"]
      date     : "2014/10/30"

    # -- Table & CRUD
    for i in [1..10]
      __.Entity.User.create
        id          : i
        name        : "Name #{i}"
        description : "Description #{i}"
        url         : "http://#{i}"
        when        : new Date()
        style       : "style #{i}"

    @table.instance.row 0 # Select by index
    setTimeout (=> @table.instance.row __.Entity.User.all()[5]), 1000 # Select by entity
    new Atoms.Organism.Crud
      id      : "user"
      entity  : "__.Entity.User"
      fields  : ["name", "description", "url", "when"]
      required: ["name"]

  # -- Children Bubble Events --------------------------------------------------
  onSectionShow: (section) ->
    @header.context.el.html section.attributes.id

  onCarouselNext: ->
    @carousel.assistant.next()

  onCarouselPrevious:  ->
    @carousel.assistant.previous()

  onCalendarSelect: (day, instance) ->
    console.log "onCalendarSelect", day.attributes.date
    method = if day.attributes.event? then "remove" else "set"
    instance["#{method}Event"] day.attributes.date
    false

  onGMapTouch:(event, atom, dispatcher) ->
    console.log "onGMapTouch", event
    false

  onGMapMarker: (event, atom, dispatcher) ->
    console.log "onGMapMarker", event
    false

  onLeafletTouch:(event, atom, dispatcher) ->
    console.log "onLeafletTouch", event
    false

  onLeafletMarker: (event, atom, dispatcher) ->
    console.log "onLeafletMarker", event
    false

  onMap:  (event, atom, dispatcher) ->
    values = latitude: 43.23, longitude: 2.94, id: new Date()
    dispatcher.instance.marker values
    dispatcher.instance.marker {latitude: 43.233, longitude: 2.943}
    dispatcher.instance.center values
    dispatcher.instance.zoom 12
    false

  onMapClear: (event, atom, dispatcher) ->
    dispatcher.instance.clean()
    dispatcher.instance.zoom 10
    false

  onMapRoute: (event, atom, dispatcher) ->
    origin = latitude: 43.23, longitude: 2.94
    destination = latitude: 43.233, longitude: 2.943
    dispatcher.instance.route origin, destination
    false

  onRangeChange: (event, atom) ->
    console.log "onInputRangeChange", atom.value()

  onAppnimaSessionLogin: (event) ->
    console.log "onAppnimaSessionLogin", event

  onAppnimaSessionSignup: (event) ->
    console.log "onAppnimaSessionSignup", event

  onAppnimaSessionError: (event) ->
    console.log "onAppnimaSessionError", event

  onAppnimaProfileError: (event) ->
    console.log "onAppnimaProfileError", event

  onAppnimaProfileChange: (event) ->
    console.log "onAppnimaProfileChange", event

  onAppnimaProfileLogout: (event) ->
    console.log "onAppnimaProfileLogout", event

  onPayments: (event, atom) ->
    __.Dialog.AppnimaCreditCard.purchase(10.23, "Osito de peluche")

  # onCarouselStart: (event) ->
  #   console.info "onCarouselStart", event

  # onCarouselChange: (event) ->
  #   console.info "onCarouselChange", event.index

  # onCarouselEnd: (event) ->
  #   console.info "onCarouselEnd", event

  onTableSelect: (row, table) ->
    __.Dialog.User.show
      title   : "Edit #{row.entity.name}"
      entity  : row.entity
      # fields  : ["id", "name", "when"]
      # required: ["description"]
      destroy : true

new Extensions()
