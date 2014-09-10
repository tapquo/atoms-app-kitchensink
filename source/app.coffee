Atoms.$ ->
  console.log Atoms.version, " || ", __.version

  # Atoms.Url.options.absolute = true
  if Atoms.Url.options.absolute or not Atoms.Url.path()
    Atoms.Url.path("form/main")

