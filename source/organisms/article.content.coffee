class Content extends Atoms.Organism.Article

  @scaffold "assets/scaffolds/article.content.json"

  # -- Children Bubble Events --------------------------------------------------
  onSectionShow: (section) ->
    if section.attributes.id is "others"
      setTimeout =>
        for child in section.children when child.constructor.base is "Progress"
          console.log child.value 75
      , 300

  onSectionHide: (section) ->
    if section.attributes.id is "others"
      child.value 0 for child in section.children when child.constructor.base is "Progress"

content = new Content()
