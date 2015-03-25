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

    getSpinnerClass = (flag, notSpinningIcon)->
      if flag
        "fa-spinner fa-spin"
      else
        "fa-#{notSpinningIcon}"

    getButtonStyle = (error, style = "default")->
      if error
        "btn-danger"
      else
        "btn-#{style}"

    render: ->
      spinner =
        saving: getSpinnerClass(@props.saving, "save")
        running: getSpinnerClass(@props.running, "play-circle")
        inserting: getSpinnerClass(@props.inserting, "file-text")

      buttonStyle =
        save: getButtonStyle(@props.errorOnSaving, "primary")
        run: getButtonStyle(@props.errorOnRunning)
        insert: getButtonStyle(@props.errorOnInserting)

      <div className="coding-actions">
        <button onClick={this.onClickSave} className="btn btn-sm #{buttonStyle.save}"><i className="fa #{spinner.saving}" /> Save</button>
        <button onClick={this.onClickRun} className="btn btn-sm #{buttonStyle.run}"><i className="fa #{spinner.running}" /> Run</button>
        <button onClick={this.onClickInsert} className="btn btn-sm #{buttonStyle.insert}"><i className="fa #{spinner.inserting}" /> Insert</button>
        <button onClick={this.onClickInstall} className="btn btn-sm btn-default"><i className="fa fa-hand-o-right" /> Install</button>
        <button onClick={this.onClickHelp} className="btn btn-sm btn-default"><i className="fa fa-question-circle" /> Help</button>
      </div>

