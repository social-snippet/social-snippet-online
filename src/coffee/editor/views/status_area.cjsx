define ["react", "underscore"], (React, _)->

  class StatusArea extends React.Component

    constructor: (props)->
      text = props.value || ""
      @state =
        text: text

      EditorApp.vent.on "message", (message)=>
        date = new Date
        dateText = "#{date.getHours()}:#{date.getMinutes()}:#{date.getSeconds()}"
        text = "[#{dateText}] #{message.type}: #{message.text}\n" + text
        @setState
          text: text

    render: ->
      <textarea readOnly className="status-area" value="#{this.state.text}" />

