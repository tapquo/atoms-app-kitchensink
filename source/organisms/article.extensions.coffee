"use strict"

class Extensions extends Atoms.Organism.Article

  @scaffold "assets/scaffolds/article.extensions.json"

  render: ->
    super
    carousel = @carousel.instance
    carousel.clean()
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/javi.jpg"
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/oihane.jpg"
    carousel.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/cata.jpg"
    carousel.initialize()

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

  onMap:  (event, atom, dispatcher) ->
    position = latitude: 43.23, longitude: 2.94
    dispatcher.instance.marker position
    dispatcher.instance.marker {latitude: 43.233, longitude: 2.943}
    dispatcher.instance.center position
    dispatcher.instance.zoom 13
    setTimeout =>
      dispatcher.instance.clean()
    , 3000
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

new Extensions()
