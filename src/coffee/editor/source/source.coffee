define ["backbone"], (Backbone)->

  class Source extends Backbone.Model

    url: ->
      if @id
        "/webapi/sources/#{@id}"
      else
        "/webapi/sources"

    defaults: ->
      text: "edit here"

    initialize: ->
      console.log "text: initialize"

    getText: ->
      @get "text"

