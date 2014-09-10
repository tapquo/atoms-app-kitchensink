
class DialogConfirm extends Atoms.Organism.Dialog

  constructor: (attributes = {}) ->
    attributes.id = "dialog"
    attributes.style = "warning side right"
    attributes.children = [
      "Organism.Header": children: [
        "Atom.Icon": icon: "people"
      ,
        "Atom.Heading": value: "Permisions"
      ,
        "Molecule.Navigation": style: "right", children: [
          "Atom.Button": icon: "check"
        ,
          "Atom.Link": icon: "help1", text: "Help"
        ]

      ]
    ,
      "Organism.Section": children: [
        "Atom.Text": value: "Dialogs are typically used to prompt users to make a specific decision as part of or before continuing with a task or process. They can be used to inform users about a specific issue, to confirm particularly important actions, or to explain significant ramifications of an action before allowing the user to proceed."
      ]
    ,
      "Organism.Footer": children: [
        "Molecule.Navigation": style: "-block", children: [
          "Atom.Button": text: "Info", style: "left", callbacks: ["onAccept"]
        ,
          "Atom.Button": text: "SignIn", style: "default", callbacks: ["onAccept"]
        ,
          "Atom.Button": text: "No thanks", callbacks: ["onCancel"]
        ]
      ]
    ]
    super attributes
    @bind "show", (event) -> console.info "dialog##{@attributes.id}...show"
    @bind "hide", (event) -> console.info "dialog##{@attributes.id}...hide"


  onAccept: ->
    @hide()
    Atoms.App.Dialog.Loading.show()
    setTimeout ->
      Atoms.App.Dialog.Loading.hide()
    , 1000
    false

  onCancel: ->
    @hide()
    false


class DialogForm extends Atoms.Organism.Dialog

  constructor: (attributes = {}) ->
    attributes.children = [
      "Organism.Header": children: [
        "Atom.Icon": icon: "ios7-checkmark-outline"
      ,
        "Atom.Heading": value: "Bookmard added!"
      ]
    ,
      "Organism.Section": children: [
        "Molecule.Form": children: [
          "Atom.Label": value: "Name"
        ,
          "Atom.Input": type: "text", value: "100 Days of Ice Cream", placeholder: "..."
        ,
          "Atom.Label": value: "Folder"
        ,
          "Atom.Select": options: ["Bookmarks Bar", "Friends"]
        ]
      ]
    ,
      "Organism.Footer": children: [
        "Molecule.Navigation": style: "-block", children: [
          "Atom.Button": text: "Remove", style: "left", callbacks: ["onAccept"]
        ,
          "Atom.Button": text: "Edit", callbacks: ["onAccept"]
        ,
          "Atom.Button": text: "Done", style: "default", callbacks: ["onCancel"]
        ]
      ]
    ]
    super attributes

  onCancel:  ->
    @hide()
    false


class Second extends Atoms.Organism.Article

  @scaffold "assets/scaffolds/dialogs.json"

  constructor: ->
    super
    # do @onConfirm
    # __.Dialog.Loading.show()

  onConfirm: (event, dispatcher, hierarchy...) ->
    new DialogConfirm() unless Atoms.App.Dialog.DialogConfirm?
    Atoms.App.Dialog.DialogConfirm.show()

  onForm: (event, dispatcher, hierarchy...) ->
    new DialogForm() unless Atoms.App.Dialog.DialogForm?
    Atoms.App.Dialog.DialogForm.show()

  onPush: (event, atom) ->
    __.Dialog.Push.show("@#{atom.attributes.twitter} now is following you.",  "Just a complicated human who makes things: #JavaScript Tools, @tapquo Founder & CTO, #CoffeeScript book author, #W3C Member, #HTML5 Evangelist...", "http://cdn.tapquo.com/photos/soyjavi.jpg")
    false

  onLoading: (event, dispatcher) ->
    dispatcher.el.addClass("loading").attr "disabled", true
    # setTimeout =>
    #   dispatcher.el.removeClass("loading").removeAttr "disabled"
    # , 1000

  onButtonTouch: (event, dispatcher, hierarchy...)->
    console.log "onButtonTouch"
    false

  acceptConfirm: ->
    Atoms.App.Dialog.Loading.show()
    setTimeout ->
      Atoms.App.Dialog.Loading.hide()
    , 3000

  cancelConfirm: ->
    console.log "cancel"


second = new Second()


