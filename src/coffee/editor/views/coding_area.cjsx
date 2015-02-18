define ["react"], (React)->

  class CodingArea extends React.Component

    constructor: (props)->
      @state =
        value: props.value || ""

    render: ->
      <textarea className="coding-area" value="#{this.state.value}" />

