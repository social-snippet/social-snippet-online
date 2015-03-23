define ["react"], (React)->

  class CodingActions extends React.Component

    onClickSave: =>
      @props.onClickSave() if @props.onClickSave instanceof Function

    onClickRun: =>
      @props.onClickRun() if @props.onClickRun instanceof Function

    onClickInsert: =>
      @props.onClickInsert() if @props.onClickInsert instanceof Function

    onClickInstall: =>
      @props.onClickInstall() if @props.onClickInstall instanceof Function

    render: ->
      <div className="coding-actions">
        <button onClick={this.onClickSave} className="btn btn-sm btn-primary"><i className="fa fa-save" /> Save</button>
        <button onClick={this.onClickRun} className="btn btn-sm btn-default"><i className="fa fa-play-circle" /> Run</button>
        <button onClick={this.onClickInsert} className="btn btn-sm btn-default"><i className="fa fa-file-text" /> Insert</button>
        <button onClick={this.onClickInstall} className="btn btn-sm btn-default"><i className="fa fa-hand-o-right" /> Install</button>
      </div>

