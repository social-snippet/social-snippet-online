define ["backbone"], (Backbone)->

  class Text extends Backbone.Model

    initialize: ->
      console.log "text: initialize"

