define ["react"], (React)->

  class CodingArea extends React.Component

    constructor: (props)->
      @state =
        text: props.source.getText() || ""

    render: ->
      <textarea className="coding-area" defaultValue={this.state.text} />

