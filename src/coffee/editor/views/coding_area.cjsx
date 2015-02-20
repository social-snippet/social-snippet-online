define ["react"], (React)->

  class CodingArea extends React.Component

    constructor: (props)->
      @state =
        source: props.source
        value: props.source.getText()

    componentDidMount: ->
      @richEditor = ace.edit("rich-editor")
      @richEditor.getSession().setUseWorker(false)
      @richEditor.setTheme("ace/theme/monokai")
      @richEditor.getSession().setMode("ace/mode/c_cpp")
      @richEditor.setValue @state.value
      @state.source.on "add change remove", =>
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

