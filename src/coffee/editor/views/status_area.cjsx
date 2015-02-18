define ["react"], (React)->

  class StatusArea extends React.Component

    constructor: (props)->
      @state =
        value: props.value || ""

    render: ->
      <textarea className="status-area" value="#{this.state.value}" />

