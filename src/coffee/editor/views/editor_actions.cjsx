define ["react"], (React)->

  class EditorActions extends React.Component

    render: ->
      <ul className="list-group action-list">
        <li className="list-group-item"><i className="fa fa-file-text-o" /> New</li>
        <li className="list-group-item"><i className="fa fa-folder-o" /> Open</li>
      </ul>

