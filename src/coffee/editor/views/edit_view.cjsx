define ["react"], (React)->

  class EditView extends React.Component

    CodingArea    = require("editor/views/coding_area")
    EditorActions = require("editor/views/editor_actions")
    CodingActions = require("editor/views/coding_actions")
    StatusArea    = require("editor/views/status_area")
    SourceInfo    = require("editor/views/source_info")

    constructor: (props)->
      @state =
        source: props.source
      @source = props.source
      @models = [
        @source
      ]

    componentDidMount: ->
      @source.on "add change remove", =>
        @setState source: @source
        @forceUpdate(null)

    componentWillUnmount: ->
      @models.forEach (model)=>
        model.off null, null, @

    showMessage = (text)->
      EditorApp.vent.trigger "message", {
        type: "System"
        text: text
      }

    showErrorMessage = (text)->
      EditorApp.vent.trigger "message", {
        type: "Error"
        text: text
      }

    showStatusMessage = (text)->
      EditorApp.vent.trigger "message", {
        type: "Output"
        text: text
      }

    showRawMessage = (text)->
      EditorApp.vent.trigger "message:raw", {
        text: text
      }

    save: =>
      showMessage "Saving Data..."
      @source.save()
        .then =>
          showMessage "Saved"
          EditorApp.vent.trigger "editor:show", @source
        .then null, (err)=>
          showErrorMessage err
          throw err

    run: =>
      status = new EditorApp.Editor.Status
        source_id: @source.id
      showMessage "Sending Source... (and Waiting Result...)"
      status.save()
        .then ->
          showMessage "Sent"
          term = []
          term.push "$ #{status.get "lang_version"}"
          term.push status.get("output")
          showRawMessage term.join("\n")

    onChangeSource: (event)=>
      @source.set "text", event.target.value

    onChangeLanguage: (event)=>
      @source.set "language", event.target.value

    render: ->
      <div className="row">
        <div className="editor-area">
          <CodingActions onClickSave={this.save}
            onClickRun={this.run} />
          <SourceInfo source={this.state.source}
            onChangeLanguage={this.onChangeLanguage} />
          <CodingArea source={this.state.source}
            onChange={this.onChangeSource} />
          <StatusArea />
        </div>
      </div>

