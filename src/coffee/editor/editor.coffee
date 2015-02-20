define ["marionette"], (Marionette)->

  EditorApp.module "Editor", (Editor)->
    Editor.Router     = require("editor/router")
    Editor.Controller = require("editor/controller")
    Editor.Source     = require("editor/source/source")
    Editor.Status     = require("editor/source/status")

    # init router
    EditorApp.addInitializer ->
      router = new Editor.Router
        controller: new Editor.Controller

      EditorApp.vent.on "editor:show", (source)->
        router.navigate "/-/#{source.id}"

