define ["marionette"], (Marionette)->

  EditorApp.module "Editor", (Editor)->
    Editor.Router = require("editor/router")
    Editor.Controller = require("editor/controller")

    EditorApp.addInitializer ->
      new Editor.Router
        controller: new Editor.Controller

