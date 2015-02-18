define ["react"], (React)->

  class EditView extends React.Component

    TextArea = require("editor/views/text_area")
    ActionList = require("editor/views/action_list")

    render: ->
      <div className="row">
        <div className="col-sm-2">
          <ActionList />
        </div>
        <div className="col-sm-10">
          <TextArea value="edit here" />
        </div>
      </div>

