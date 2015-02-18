define ["react"], (React)->

  class CodingActions extends React.Component

    render: ->
      <div className="coding-actions">
        <button className="btn btn-sm btn-primary">Compile</button>
        <button className="btn btn-sm btn-primary">Insert Snippet</button>
      </div>

