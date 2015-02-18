define ["backbone"], (Backbone)->

  class Source extends Backbone.Model

    url: ->
      "/webapi/sources"

    defaults: ->
      text: "edit here"

    initialize: ->
      console.log "text: initialize"

    getText: ->
      @get "text"

