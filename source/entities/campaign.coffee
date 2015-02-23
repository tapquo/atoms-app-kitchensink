"use strict"

class __.Entity.Campaign extends Atoms.Class.Entity

  @fields "id", "name", "image", "type", "value", "goals", "advocates",
          "from", "to", "updated_at", "created_at"

  # -- Static Methods
  @createOrUpdate: (attributes) =>
    entity = @findBy "id", attributes.id
    if entity?
      entity.updateAttributes attributes
    else
      @create attributes

  # -- Instance Methods
  parse: ->
    text        : @name
    info        : @created_at
    description : "Goals #{@goals.length} · Advocates #{@advocates.length}"

new __.Entity.Campaign()
