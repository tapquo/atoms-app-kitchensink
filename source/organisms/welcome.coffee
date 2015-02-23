"use strict"

class Welcome extends Atoms.Organism.Article

  @url = "assets/scaffolds/welcome.json"

  render: ->
    super
    atom = @main.appendChild "Atom.Button", text: "Remove this Atom (normal)", style: "fluid big", screen: "normal"
    atom = @main.appendChild "Atom.Button", text: "Remove this Atom (small)", style: "fluid big", screen: "small"

  # -- Children Bubble Events --------------------------------------------------
  onButtonTouch: (event, atom) ->
    atom.destroy()

new Welcome()
