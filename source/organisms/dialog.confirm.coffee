"use strict"

class Confirm extends Atoms.Organism.Dialog

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


new Confirm()
