define ["react"], (React)->

  class CodingActions extends React.Component

    render: ->
      <div className="coding-actions">
        <button className="btn btn-sm btn-primary">Save</button>
        <button className="btn btn-sm btn-default">Run</button>
        <button className="btn btn-sm btn-default">Insert</button>
      </div>

