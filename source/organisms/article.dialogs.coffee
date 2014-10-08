"use strict"

class Dialogs extends Atoms.Organism.Article

  @scaffold "assets/scaffolds/article.dialogs.json"

  # -- Children Bubble Events --------------------------------------------------
  onSectionShow: ->
    __.Dialog.Loading.show()
    setTimeout =>
      __.Dialog.Loading.hide()
    , 1000

  onConfirm: (event, dispatcher, hierarchy...) ->
    __.Dialog.Confirm.show()

  onForm: (event, dispatcher, hierarchy...) ->
    __.Dialog.Form.show()

  onLoading: (event) ->
    do @onSectionShow

  onPush: (event) ->
    __.Dialog.Push.show
      title      : "@soyjavi is following you. (tap to expand)"
      description: "Just a complicated human who makes things: #JavaScript Tools, @tapquo Founder & CTO, #CoffeeScript book author, #W3C Member, #HTML5 Evangelist..."
      image      : "http://cdn.tapquo.com/photos/soyjavi.jpg"
      timeout    : 3000
    false

dialogs = new Dialogs()

