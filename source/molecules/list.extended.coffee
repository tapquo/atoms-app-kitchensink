"use strict"

class Atoms.Molecule.ListExtended extends Atoms.Molecule.List

  @extends: true

  @default:
    bind:
      entity    : "__.Entity.User"
      atom      : "Atom.Li"
      create    : true
      update    : true
      destroy   : true
