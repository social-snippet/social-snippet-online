define ["react"], (React)->

  class EditView extends React.Component

    CodingArea    = require("editor/views/coding_area")
    EditorActions = require("editor/views/editor_actions")
    CodingActions = require("editor/views/coding_actions")
    StatusArea    = require("editor/views/status_area")

    constructor: (props)->
      @state = {
        source: props.source
      }
      @models = [
        props.source
      ]

    componentDidMount: ->
      @getBackboneModels().forEach (model)=>
        model.on "add change remove", @forceUpdate.bind(@, null), @

    componentWillUnmount: ->
      @getBackboneModels().forEach (model)=>
        model.off null, null, @

    getBackboneModels: ->
      @models

    onSave: =>
      @state.source.save()
        .then ->
          console.log "save ok"

    render: ->
      <div className="row">
        <div className="col-sm-2">
          <EditorActions />
        </div>
        <div className="editor-area col-sm-10">
          <CodingActions onClickSave={this.onSave} />
          <CodingArea source={this.state.source} />
          <StatusArea />
        </div>
      </div>

