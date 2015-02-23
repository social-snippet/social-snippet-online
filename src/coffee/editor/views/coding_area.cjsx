define ["react"], (React)->

  class CodingArea extends React.Component

    constructor: (props)->
      @state =
        source: props.source

    componentDidMount: ->
      @richEditor = ace.edit("rich-editor")
      @richEditor.getSession().setUseWorker(false)
      @richEditor.setTheme("ace/theme/monokai")
      @richEditor.getSession().setMode("ace/mode/#{resolveLanguage(@state.source)}")
      @richEditor.setValue @state.source.getText()

      @state.source.on "change:language", =>
        @richEditor.getSession().setMode("ace/mode/#{resolveLanguage(@state.source)}")

      @state.source.on "change:text", =>
        if @richEditor.getValue() != @state.source.getText()
          @richEditor.setValue @state.source.getText()

      @richEditor.on "change", =>
        @state.source.set "text", @richEditor.getValue()

    componentWillUnmount: ->
      @richEditor.destroy()

    render: ->
      <div>
        <textarea className="coding-area hidden" value={this.state.source.getText()} onChange={this.props.onChange} />
        <div id="rich-editor"></div>
      </div>

    resolveLanguage = (source)->
      name = numToLang[source.getLanguage()]
      console.log name
      if modeAda(name)
        "ada"
      else if modeAssembler(name)
        "assembly_x86"
      else if modeC(name)
        "c_cpp"
      else if modeCSharp(name)
        "csharp"
      else if modeClojure(name)
        "clojure"
      else if modeCOBOL(name)
        "cobol"
      else if modeErlang(name)
        "erlang"
      else if modeForth(name)
        "forth"
      else if modeGo(name)
        "golang"
      else if modeLisp(name)
        "lisp"
      else if modePerl(name)
        "perl"
      else if modeRuby(name)
        "ruby"
      else if modeShell(name)
        "sh"
      else # not supported
        "c_cpp"

    modeAda = (name)->
      /^Ada/.test name

    modeAssembler = (name)->
      /^Assembler/.test name

    modeAwk = (name)->
      /^AWK/.test name

    modeShell = (name)->
      /^Bash/.test name

    modeBc = (name)->
      /^bc/.test name

    modeC = (name)->
      /^C\+\+/.test name ||
        /^C99/.test name ||
        /^C$/.test name

    modeCSharp = (name)->
      /^C#/.test name

    modeCOBOL = (name)->
      /^COBOL/.test name

    modeClojure = (name)->
      /^Clojure/.test name

    modeErlang = (name)->
      /^Erlang/.test name

    modeForth = (name)->
      /^Forth/.test name

    modeGo = (name)->
      /^Go$/.test name

    modeRuby = (name)->
      /^Ruby$/.test name

    modeD = (name)->
      /^D$/.test name ||
        /^D \(dmd\)$/.test name

    modeLisp = (name)->
      /^CLIPS$/.test name ||
        /^Common Lisp/.test name

    modePerl = (name)->
      /^Perl/.test name

    numToLang =
      7: "Ada"
      13: "Assembler"
      45: "Assembler"
      104: "AWK (gawk)"
      105: "AWK (mawk)"
      28: "Bash"
      110: "bc"
      12: "Brainf**k"
      11: "C"
      27: "C#"
      41: "C++ 4.3.2"
      1: "C++ 4.9.2"
      44: "C++14"
      34: "C99 strict"
      14: "CLIPS"
      111: "Clojure"
      118: "COBOL"
      106: "COBOL 85"
      32: "Common Lisp (clisp)"
      20: "D"
      102: "D (dmd)"
      36: "Erlang"
      124: "F#"
      123: "Factor"
      125: "Falcon"
      107: "Forth"
      5: "Fortran"
      114: "Go"
      121: "Groovy"
      21: "Haskell"
      16: "Icon"
      9: "Intercal"
      10: "Java"
      55: "Java7"
      35: "JavaScript (rhino)"
      112: "JavaScript (spidermonkey)"
      26: "Lua"
      30: "Nemerle"
      25: "Nice"
      122: "Nimrod"
      56: "Node.js"
      43: "Objective-C"
      8: "Ocaml"
      127: "Octave"
      119: "Oz"
      57: "PARI/GP"
      22: "Pascal (fpc)"
      2: "Pascal (gpc)"
      3: "Perl"
      54: "Perl 6"
      29: "PHP"
      19: "Pike"
      108: "Prolog (gnu)"
      15: "Prolog (swi)"
      4: "Python"
      99: "Python (Pypy)"
      116: "Python 3"
      117: "R"
      17: "Ruby"
      39: "Scala"
      128: "Scheme (chicken)"
      33: "Scheme (guile)"
      23: "Smalltalk"
      40: "SQL"
      38: "Tcl"
      62: "Text"
      115: "Unlambda"
      101: "VB.NET"
      6: "Whitespace"
