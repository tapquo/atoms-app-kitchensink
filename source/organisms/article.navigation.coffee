"use strict"

class Navigation extends Atoms.Organism.Article

  @url = "assets/scaffolds/article.navigation.json"


  constructor: ->
    super
    @bind "show", @onArticleShow
    @bind "hide", @onArticleHide

  # -- Instance Events --------------------------------------------------
  onArticleShow: (event) ->
    console.info "onArticleShow", event

  onArticleHide: (event) ->
    console.info "onArticleHide", event

  # -- Children Bubble Events --------------------------------------------------
  onSectionShow: (section) ->
    console.info "onSectionShow", section

  onSectionHide: (section) ->
    console.info "onSectionHide", section

new Navigation()
