class Form extends Atoms.Organism.Article

  @scaffold "../source/organisms/form.json"

  constructor: ->
    super
    @bind "show", (event) -> console.info "article##{@attributes.id}...show"
    @bind "hide", (event) -> console.info "article##{@attributes.id}...hide"

  render: ->
    super
    setTimeout =>
      @header.progress.value 0

      @main.form.switch_1.value false
      @main.form.switch_2.value true
      setTimeout =>
        @main.form.switch_1.value true
        @main.form.switch_2.value false
      , 1000
    , 1000


    setTimeout =>
      @main.progress.value 10
    , 1000
    @main.progress.el.bind "touch", =>
      @main.progress.value (@main.progress.value() + 10)

    Atoms.$("button").attr "data-tooltip", "hello world"

  onSectionShow: (section) ->
    console.info "onSectionShow", section

  onListPath: () ->
    Atoms.Url.path "list/binding"

  # Form events
  onFormChange: (event, form, hierarchy...) ->
    console.info "onFormChange", event, form, hierarchy

  onFormSubmit: (event, form, hierarchy...) ->
    console.info "onFormSubmit", form.value()

  onFormError: (event, form, hierarchy...) ->
    console.info "onFormError", form.value()

  # Form children events
  onHeadingTouch: (event, atom) ->
    atom.refresh text: "Atoms"

  onInputKeyup: (event, atom, hierarchy...) ->
    console.info "onInputKeyup", atom.value()

  onSelectChange: (event, atom, hierarchy...) ->
    console.info "onSelectChange", atom.value()

  onSwitchChange: (event, atom) ->
    console.log "onSwitchChange", atom.value()

  onButtonTouch: (event, atom, hierarchy) ->
    __.Dialog.Loading.show()
    setTimeout ->
      __.Dialog.Loading.hide()
    , 850

  onFigureTouch: (event, atom) ->
    atom.el.html "touch"

  onFigureTap: (event, atom) -> atom.el.html "tap"

  onFigureHold: (event, atom) -> atom.el.html "hold"

  onFigureSwiping: (event, atom) ->
    event.originalEvent.preventDefault()
    atom.el.html "Swiping"

  onFigureSwipe: (event, atom) -> atom.el.html "swipe"

  onFigureRotate: (event, atom) -> atom.el.html "rotate"

  onFigurePinch: (event, atom) -> atom.el.html "pinch"

    # Figure Children events
  onFigureTouch: (event, atom) ->
    atom.refresh url: "http://cdn.tapquo.com/photos/jany.jpg"

  #  Media Events
  onLoad: ->
    @secondary.player.el.children().attr "disabled", true
    @secondary.audio.src "http://designmodo.com/demo/audioplayer/media/demo.mp3"
    @secondary.video.src "http://www.html5rocks.com/en/tutorials/video/basics/devstories.mp4"

  onPlay: ->
    @secondary.audio.play()
    @secondary.video.play()

  onPause: ->
    @secondary.audio.pause()
    @secondary.video.pause()

  onReload: ->
    @secondary.audio.stop()
    @secondary.video.stop()

  onMute: ->
    if @secondary.audio.volume() > 0
      console.log "mute"
      @secondary.audio.volume 0
      @secondary.video.volume 0
    else
      console.log "listen"
      @secondary.audio.volume 50
      @secondary.video.volume 50

  onAudioLoad: (event) ->
    console.log "audio.load"
    @secondary.player.el.children().removeAttr "disabled"

  onAudioError: (event) ->
    console.log "audio.error", event

  onAudioDownloading: (event) ->
    console.log "audio.Downloading", event

  onAudioPlay: (event) ->
    console.log "audio.play"

  onAudioTiming: (event) ->
    console.log "audio.timing", @secondary.audio.time(), @secondary.audio.duration()

  onAudioPause: (event) ->
    console.log "audio.pause"

  onAudioStop: (event) ->
    console.log "audio.stop"

  onAudioEnd: (event) ->
    console.log "audio.end"

  onVideoLoad: (event) ->
    console.log "video.load", event

  onVideoError: (event) ->
    console.log "video.error", event

  onVideoDownloading: (event) ->
    console.log "video.Downloading", event

  onVideoPlay: (event) ->
    console.log "video.play"

  onVideoTiming: (event) ->
    console.log "video.timing", @secondary.video.time(), @secondary.video.duration()

  onVideoPause: (event) ->
    console.log "video.pause"

  onVideoStop: (event) ->
    console.log "video.stop"

  onVideoEnd: (event) ->
    console.log "video.end"




form = new Form()

__log = (method, event) -> console.log "article.#{method}"
