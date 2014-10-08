"use strict"

class Media extends Atoms.Organism.Article

  @url = "assets/scaffolds/article.media.json"

  # -- Children Bubble Events --------------------------------------------------
  onLoad: ->
    @player.el.children().attr "disabled", true
    @main.audio.src "http://designmodo.com/demo/audioplayer/media/demo.mp3"
    @main.video.src "http://www.html5rocks.com/en/tutorials/video/basics/devstories.mp4"

  onPlay: ->
    @main.audio.play()
    @main.video.play()

  onPause: ->
    @main.audio.pause()
    @main.video.pause()

  onReload: ->
    @main.audio.stop()
    @main.video.stop()

  onMute: ->
    if @main.audio.volume() > 0
      console.log "mute"
      @main.audio.volume 0
      @main.video.volume 0
    else
      console.log "listen"
      @main.audio.volume 50
      @main.video.volume 50

  # -- Audio
  onAudioLoad: (event) ->
    console.log "audio.load"
    @player.el.children().removeAttr "disabled"

  onAudioError: (event) ->
    console.log "audio.error", event

  onAudioDownloading: (event) ->
    console.log "audio.Downloading", event

  onAudioPlay: (event) ->
    console.log "audio.play"

  onAudioTiming: (event) ->
    console.log "audio.timing", @main.audio.time(), @main.audio.duration()

  onAudioPause: (event) ->
    console.log "audio.pause"

  onAudioStop: (event) ->
    console.log "audio.stop"

  onAudioEnd: (event) ->
    console.log "audio.end"

  # -- Video
  onVideoLoad: (event) ->
    console.log "video.load", event

  onVideoError: (event) ->
    console.log "video.error", event

  onVideoDownloading: (event) ->
    console.log "video.Downloading", event

  onVideoPlay: (event) ->
    console.log "video.play"

  onVideoTiming: (event) ->
    console.log "video.timing", @main.video.time(), @main.video.duration()

  onVideoPause: (event) ->
    console.log "video.pause"

  onVideoStop: (event) ->
    console.log "video.stop"

  onVideoEnd: (event) ->
    console.log "video.end"

new Media()
