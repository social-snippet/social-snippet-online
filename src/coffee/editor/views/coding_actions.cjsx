define ["react"], (React)->

  class CodingActions extends React.Component

    callPropFunc: (name)->
      @props[name]() if @props[name] instanceof Function

    onClickSave: =>
      @callPropFunc "onClickSave"

    onClickRun: =>
      @callPropFunc "onClickRun"

    onClickInsert: =>
      @callPropFunc "onClickInsert"

    onClickInstall: =>
      @callPropFunc "onClickInstall"

    onClickHelp: =>
      @callPropFunc "onClickHelp"

    render: ->
      <div className="coding-actions">
        <button onClick={this.onClickSave} className="btn btn-sm btn-primary"><i className="fa fa-save" /> Save</button>
        <button onClick={this.onClickRun} className="btn btn-sm btn-default"><i className="fa fa-play-circle" /> Run</button>
        <button onClick={this.onClickInsert} className="btn btn-sm btn-default"><i className="fa fa-file-text" /> Insert</button>
        <button onClick={this.onClickInstall} className="btn btn-sm btn-default"><i className="fa fa-hand-o-right" /> Install</button>
        <button onClick={this.onClickHelp} className="btn btn-sm btn-default"><i className="fa fa-question-circle" /> Help</button>
      </div>

