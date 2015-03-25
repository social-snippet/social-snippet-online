define ["react", "underscore", "jquery"], (React, _, jQuery)->

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
        text += "[#{dateText}] #{message.type}: #{message.text}\n"
        @setState
          text: text

      EditorApp.vent.on "message:raw", (message)=>
        text += "#{message.text}\n"
        @setState
          text: text

    componentDidUpdate: =>
      element = jQuery(React.findDOMNode @refs.statusArea)
      element.scrollTop(element[0].scrollHeight - element.height())

    render: ->
      <textarea ref="statusArea" readOnly className="status-area" value="#{this.state.text}" />

