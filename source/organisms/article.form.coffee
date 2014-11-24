class Form extends Atoms.Organism.Article

  @scaffold "assets/scaffolds/article.form.json"

  render: ->
    super
    @main.form.value text: "soyjavi", password: 1234

    setTimeout =>
      @example.form.range.value 5
      @example.form.checkbox.value false
      @example.form.switch.value false
      setTimeout =>
        @example.form.range.value 0
        @example.form.checkbox.value true
        @example.form.switch.value true
      , 1000
    , 1000

  # -- Children Bubble Events --------------------------------------------------
  onClear: ->
    @example.form.clean()
    false

  onFormChange: (event, form, hierarchy...) ->
    console.info "onFormChange", event, form, hierarchy

  onFormSubmit: (event, form, hierarchy...) ->
    console.info "onFormSubmit", form.value()

  onFormError: (event, form, hierarchy...) ->
    console.info "onFormError", form.value()

  onButtonTouch: (event, atom) ->
    atom.el.addClass("loading").attr "disabled", true
    setTimeout =>
      atom.el.removeClass("loading").removeAttr "disabled"
    , 1000

form = new Form()
