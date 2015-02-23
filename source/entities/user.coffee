"use strict"

# class Atoms.Entity.User extends Atoms.Class.Entity
class __.Entity.User extends Atoms.Class.Entity

  @fields "id", "name", "description", "url", "when", "style"

  @create: (attributes) =>
    entity = @findBy "name", attributes.name
    if entity?
      entity.updateAttributes attributes
    else
      super attributes

  parse: ->
    image       : @url
    icon        : "user" unless @url
    info        : @when
    text        : "#{@name} (name)"
    description : @description or new Date()
    # style       : if @url then "thumb" else @style
    # For table example
    name        : "#{@name} (name)"
    when        : @when
