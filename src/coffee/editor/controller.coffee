define ["marionette", "react"], (Marionette, React)->
  
  class EditorController extends Marionette.Controller

    initialize: ->
      console.log "editor: init controller"

    showNewSource: ->
      newSource = new EditorApp.Editor.Source

      EditView = require("editor/views/edit_view")
      @mainContainer ||= document.getElementById("main-container")
      React.render(React.createElement(EditView, {source: newSource}), @mainContainer)

    showSource: (id)->
      console.log arguments

