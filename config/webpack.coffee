webpack = require("webpack")
path = require("path")

webpackPlugins = []

webpackPlugins.push new webpack.ResolverPlugin [
  new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
]

webpackPlugins.push new webpack.DefinePlugin
  VERSION: JSON.stringify("0.0.0")

unless process.env["DISABLE_UGLIFY_JS"] == "yes"
  console.log "webpack: enable uglifyjs"
  webpackPlugins.push new webpack.optimize.UglifyJsPlugin
    compress:
      warnings: false
else
  console.log "webpack: disable uglifyjs"

module.exports =

  entry:
    "app": "app"

  resolve:
    root: [
      path.join(__dirname, "../bower_components")
      path.join(__dirname, "../node_modules/react")
      path.join(__dirname, "../src/coffee")
    ]

    extensions: [
      ""
      ".coffee"
      ".cjsx"
      ".js"
      ".jsx"
    ]

  output:
    filename: "[name].js"

  externals:
    "jquery": "jQuery"

  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee" }
      { test: /\.cjsx$/, loader: "transform?coffee-reactify" }
    ] 

  plugins: webpackPlugins

