define ["marionette", "react"], (Marionette, React)->
  
  class EditorController extends Marionette.Controller

    EditView = require("editor/views/edit_view")

    initialize: ->
      console.log "editor: init controller"
      @mainContainer ||= document.getElementById("main-container")

    create: ->
      source = new EditorApp.Editor.Source
      React.render(React.createElement(EditView, {source: source}), @mainContainer)

    show: (id)->
      source = new EditorApp.Editor.Source
        id: id

      editorElement = React.createElement(EditView, {source: source})
      editor = React.render(editorElement, @mainContainer)
      EditorApp.vent.trigger "message", {
        type: "System"
        text: "Loading data..."
      }

      source.fetch()
        .then =>
          EditorApp.vent.trigger "message", {
            type: "System"
            text: "Loaded."
          }
          editor.setState
            source: source

