"use strict"

class Form extends Atoms.Organism.Dialog

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

new Form()
