define ["react"], (React)->

  class TextArea extends React.Component

    constructor: (props)->
      @state =
        value: props.value

    render: ->
      <textarea className="ssnip-editor" value="#{this.state.value}" />

