define ["react"], (React)->

  class EditView extends React.Component

    CodingArea    = require("editor/views/coding_area")
    EditorActions = require("editor/views/editor_actions")
    CodingActions = require("editor/views/coding_actions")
    StatusArea    = require("editor/views/status_area")

    constructor: (props)->
      @state = {}
      @source = props.source
      @models = [
        @source
      ]

    componentDidMount: ->
      @source.on "add change remove", =>
        @setState value: @source.getText()
        @forceUpdate(null)

    componentWillUnmount: ->
      @getBackboneModels().forEach (model)=>
        model.off null, null, @

    getBackboneModels: ->
      @models

    onSave: =>
      @source.save()
        .then =>
          EditorApp.vent.trigger "editor:show", @source
        .then null, (err)=>
          throw err

    onChangeSource: (event)=>
      @source.set "text", event.target.value

    render: ->
      <div className="row">
        <div className="col-sm-2">
          <EditorActions />
        </div>
        <div className="editor-area col-sm-10">
          <CodingActions onClickSave={this.onSave} />
          <CodingArea value={this.state.value} source={this.source} onChange={this.onChangeSource} />
          <StatusArea />
        </div>
      </div>

