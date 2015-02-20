define ["react", "underscore"], (React, _)->

  class StatusArea extends React.Component

    constructor: (props)->
      text = props.value || ""
      @state =
        text: text

      padding = (s)->
        s = "#{s}"
        "00".slice(s.length) + s

      EditorApp.vent.on "message", (message)=>
        date = new Date
        dateText = "#{padding date.getHours()}:#{padding date.getMinutes()}:#{padding date.getSeconds()}"
        text = "[#{dateText}] #{message.type}: #{message.text}\n" + text
        @setState
          text: text

    render: ->
      <textarea readOnly className="status-area" value="#{this.state.text}" />

