define ["react"], (React)->

  class CodingArea extends React.Component

    constructor: (props)->
      @value = props.source.getText()

    render: ->
      <textarea className="coding-area" defaultValue={this.value} onChange={this.props.onChange} />

