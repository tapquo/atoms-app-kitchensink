class Options2 extends Atoms.Organism.Aside

  @scaffold "../source/organisms/aside2.json"


  @default:
    style: "right"
    children: [
      "Atom.Header": text: "input"
    ]

aside2 = new Options2()
