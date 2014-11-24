"use strict"

class Welcome extends Atoms.Organism.Article

  @url = "assets/scaffolds/welcome.json"

  render: ->
    super
    atom = @main.appendChild "Atom.Button", text: "remove", style: "fluid"
    console.log "CHILDREN", @main.children

    # setTimeout =>
    #   @main.children[1].destroy()
    #   atom.destroy()
    #   console.log "CHILDREN", @main.children
    # , 1000

    setTimeout =>
      # @main.destroyChildren(@main.children[1].uid)
      @main.destroyChildren()
      console.log "CHILDREN", @main.children
    , 2000

new Welcome()
