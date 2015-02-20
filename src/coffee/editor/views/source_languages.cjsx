define ["react", "underscore"], (React, _)->

  class SourceLanguages extends React.Component

    constructor: (props)->
      @options = _(languages).map (id, name)->
        <option value={id}>{name}</option>

    render: ->
      <select>{this.options}</select>

    # ideone's language: name => id
    languages =
      "Ada": 7
      "Assembler": 13
      "Assembler": 45
      "AWK (gawk)": 104
      "AWK (mawk)": 105
      "Bash": 28
      "bc": 110
      "Brainf**k": 12
      "C": 11
      "C#": 27
      "C++ 4.3.2": 41
      "C++ 4.9.2": 1
      "C++14": 44
      "C99 strict": 34
      "CLIPS": 14
      "Clojure": 111
      "COBOL": 118
      "COBOL 85": 106
      "Common Lisp (clisp)": 32
      "D": 20
      "D (dmd)": 102
      "Erlang": 36
      "F#": 124
      "Factor": 123
      "Falcon": 125
      "Forth": 107
      "Fortran": 5
      "Go": 114
      "Groovy": 121
      "Haskell": 21
      "Icon": 16
      "Intercal": 9
      "Java": 10
      "Java7": 55
      "JavaScript (rhino)": 35
      "JavaScript (spidermonkey)": 112
      "Lua": 26
      "Nemerle": 30
      "Nice": 25
      "Nimrod": 122
      "Node.js": 56
      "Objective-C": 43
      "Ocaml": 8
      "Octave": 127
      "Oz": 119
      "PARI/GP": 57
      "Pascal (fpc)": 22
      "Pascal (gpc)": 2
      "Perl": 3
      "Perl 6": 54
      "PHP": 29
      "Pike": 19
      "Prolog (gnu)": 108
      "Prolog (swi)": 15
      "Python": 4
      "Python (Pypy)": 99
      "Python 3": 116
      "R": 117
      "Ruby": 17
      "Scala": 39
      "Scheme (chicken)": 128
      "Scheme (guile)": 33
      "Smalltalk": 23
      "SQL": 40
      "Tcl": 38
      "Text": 62
      "Unlambda": 115
      "VB.NET": 101
      "Whitespace": 6
