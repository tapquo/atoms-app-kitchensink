class Extensions extends Atoms.Organism.Article

  @scaffold "assets/scaffolds/extensions.json"

  render: ->
    super
    carousel = @carousel.instance
    carousel.clean()
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/javi.jpg"
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/oihane.jpg"
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/cata.jpg"
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/jany.jpg"
    carousel.initialize()

    @calendar.first.setEvent new Date(2014, 7, 15)
    @calendar.first.setEvent new Date(2014, 7, 29)
    @calendar.first.setEvent new Date(2014, 7, 30)
    @calendar.first.setEvent new Date(2014, 7, 31)
    @calendar.first.setEvent new Date(2014, 8, 1)
    @calendar.second.setEvent new Date(1980, 3, 10)
    @calendar.first.removeEvent new Date(2014, 7, 30)

    @calendar.second.setEvent [
      new Date(2014, 5, 14),
      new Date(2014, 5, 16),
      new Date(2014, 5, 17),
      new Date(2014, 5, 18)
    ]

    @calendar.first.refresh
      available: ["2014/08/29", "2014/08/30", "2014/08/31", "2014/09/01"]
      date     : "2014/08/30"


  onGMapMenu: (event, GMap) ->
    position = latitude: 43.23, longitude: 2.94
    GMap.instance.marker position
    GMap.instance.marker {latitude: 43.233, longitude: 2.943}
    GMap.instance.center position
    GMap.instance.zoom 13
    setTimeout =>
      GMap.instance.clean()
    , 3000

  # onCarouselStart: (event) ->
  #   console.info "onCarouselStart", event

  # onCarouselChange: (event) ->
  #   console.info "onCarouselChange", event.index

  # onCarouselEnd: (event) ->
  #   console.info "onCarouselEnd", event

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

  onCarouselNext: ->
    @carousel.assistant.next()

  onCarouselPrevious:  ->
    @carousel.assistant.previous()

  onCalendarSelect: (day, instance) ->
    console.log "onCalendarSelect", day.attributes.date
    method = if day.attributes.event? then "remove" else "set"
    instance["#{method}Event"] day.attributes.date
    false

extensions = new Extensions()
