define ["react"], (React)->

  class CodingActions extends React.Component

    render: ->
      <div className="coding-actions">
        <button className="btn btn-sm btn-primary"><i className="fa fa-save" /> Save</button>
        <button className="btn btn-sm btn-default"><i className="fa fa-play-circle" /> Run</button>
        <button className="btn btn-sm btn-default"><i className="fa fa-download" /> Insert</button>
      </div>

