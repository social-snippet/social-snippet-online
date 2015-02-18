Marionette = require("marionette")
global.EditorApp = new Marionette.Application
require "editor/editor"

jQuery ->
  Backbone = require("backbone")
  EditorApp.start()
  Backbone.history.start
    pushState: true
