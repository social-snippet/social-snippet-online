define ["react"], (React)->

  class SourceInfo extends React.Component

    SourceLanguages = require("editor/views/source_languages")

    constructor: (props)->
      @state =
        source: props.source

    render: ->
      <div className="source-info">
        <SourceLanguages source={this.state.source} onChange={this.props.onChangeLanguage} selected={this.props.defaultLanguage} />
      </div>

