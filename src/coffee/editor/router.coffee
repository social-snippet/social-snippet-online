define ["marionette"], (Marionette)->

  class EditorRouter extends Marionette.AppRouter

    initialize: ->
      console.log "editor: init router"

    appRoutes:
      "": "showNewSource"
      "/sources/-/:id": "showSource"

