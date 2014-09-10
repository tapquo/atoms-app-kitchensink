class Options extends Atoms.Organism.Aside

  @scaffold "../source/organisms/aside.json"

  constructor: ->
    super
    @bind "show", (event) -> console.info "aside##{@attributes.id}...show"
    @bind "hide", (event) -> console.info "aside##{@attributes.id}...hide"

aside = new Options()
