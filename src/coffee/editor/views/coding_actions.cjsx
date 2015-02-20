define ["react"], (React)->

  class CodingActions extends React.Component

    onClickSave: =>
      @props.onClickSave() if @props.onClickSave is Function

    onClickRun: =>
      @props.onClickRun() if @props.onClickRun is Function

    onClickInsert: =>
      @props.onClickInsert() if @props.onClickInsert is Function

    render: ->
      <div className="coding-actions">
        <button onClick={this.onClickSave} className="btn btn-sm btn-primary"><i className="fa fa-save" /> Save</button>
        <button onClick={this.onClickRun} className="btn btn-sm btn-default"><i className="fa fa-play-circle" /> Run</button>
        <button onClick={this.onClickInsert} className="btn btn-sm btn-default"><i className="fa fa-download" /> Insert</button>
      </div>

