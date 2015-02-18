define ["marionette", "react"], (Marionette, React)->
  
  class EditorController extends Marionette.Controller

    initialize: ->
      console.log "editor: init controller"

    showNewText: ->
      EditView = require("editor/views/edit_view")
      @mainContainer ||= document.getElementById("main-container")
      React.render(React.createElement(EditView, null), @mainContainer)

