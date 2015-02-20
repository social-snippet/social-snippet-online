define ["react"], (React)->

  class SourceInfo extends React.Component

    SourceLanguages = require("editor/views/source_languages")

    render: ->
      <div className="source-info">
        <SourceLanguages defaultValue={this.props.defaultLanguage} onChange={this.props.onChangeLanguage} selected={this.props.defaultLanguage} />
      </div>

