define ["react"], (React)->

  class EditView extends React.Component

    CodingArea    = require("editor/views/coding_area")
    EditorActions = require("editor/views/editor_actions")
    CodingActions = require("editor/views/coding_actions")
    StatusArea    = require("editor/views/status_area")

    render: ->
      <div className="row">
        <div className="col-sm-2">
          <EditorActions />
        </div>
        <div className="editor-area col-sm-10">
          <CodingActions />
          <CodingArea value="edit here" />
          <StatusArea value="" />
        </div>
      </div>

