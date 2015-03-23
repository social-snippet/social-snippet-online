define ["backbone", "jquery"], (Backbone, jQuery)->

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

    insertSnippet: ->
      source = @
      ajaxOpts =
        url: "#{SSNIP_URL}/actions/insert"
        type: "post"
        dataType: "json"
        data:
          text: source.getText()

      jQuery.ajax ajaxOpts
        .then (res)->
          source.set "text", res.text

