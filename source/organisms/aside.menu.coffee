class Atoms.Organism.Menu extends Atoms.Organism.Aside

  # @scaffold "assets/scaffolds/aside.menu.json"

  @url = "assets/scaffolds/aside.menu.json"

  constructor: ->
    super
    @bind "show", (event) -> console.info "aside##{@attributes.id}...show"
    @bind "hide", (event) -> console.info "aside##{@attributes.id}...hide"
