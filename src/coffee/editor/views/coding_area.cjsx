define ["react"], (React)->

  class CodingArea extends React.Component

    constructor: (props)->
      @state =
        text: props.defaultValue || ""

    render: ->
      <textarea className="coding-area" defaultValue={this.state.text} />

