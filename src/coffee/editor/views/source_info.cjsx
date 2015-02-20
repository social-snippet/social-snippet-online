define ["react"], (React)->

  class SourceInfo extends React.Component

    SourceLanguages = require("editor/views/source_languages")

    render: ->
      <div className="source-info">
        <SourceLanguages />
      </div>

