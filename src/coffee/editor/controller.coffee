define ["marionette", "react"], (Marionette, React)->
  
  class EditorController extends Marionette.Controller

    initialize: ->
      console.log "editor: init controller"

    showNewText: ->
      TextArea = require("editor/views/text_area")
      @mainContainer ||= document.getElementById("main-container")
      React.render(React.createElement(TextArea, null), @mainContainer)

