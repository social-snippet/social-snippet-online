define ["backbone"], (Backbone)->

  class Status extends Backbone.Model

    url: ->
      "/webapi/statuses"

    defaults: ->
      source_id: ""

    initialize: ->
      console.log "status: initialize"

