define ["react"], (React)->

  class CodingActions extends React.Component

    render: ->
      <div className="coding-actions">
        <button className="btn btn-sm btn-success">Compile</button>
        <button className="btn btn-sm btn-success">Insert Snippet</button>
      </div>

