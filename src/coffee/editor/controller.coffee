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
      source.fetch()
        .then =>
          React.render(React.createElement(EditView, {source: source}), @mainContainer)

