define ["backbone"], (Backbone)->

  class Source extends Backbone.Model

    url: ->
      if @id
        "/webapi/sources/#{@id}"
      else
        "/webapi/sources"

    defaults: ->
      text: "edit here"
      language: "1"

    getText: ->
      @get "text"

    getLanguage: ->
      parseInt(@get "language", 10)

