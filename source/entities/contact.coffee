"use strict"

# class Atoms.Entity.Contact extends Atoms.Class.Entity
class __.Entity.User extends Atoms.Class.Entity

  @fields "id", "name", "description", "url", "when", "style"

  @create: (attributes) =>
    entity = @findBy "name", attributes.name
    if entity?
      entity.updateAttributes attributes
    else
      super attributes

  parse: ->
    console.log "{parse}", @name
    style = if @url then "image"
    return {
      image       : @url
      info        : @when
      text        : @name
      description : "#{@description} #{style}"
      style       : style
    }