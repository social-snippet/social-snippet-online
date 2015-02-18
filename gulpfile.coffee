gulp = require("gulp")

do (desc = "build front-end")->
  gulp.task "bower", (done)->
    bower = require("bower")
    bower.commands.install().on "end", ->
      done()
    undefined

  gulp.task "app.js", ["bower"], ->
    gulpWebpack = require("gulp-webpack")
    webpackConfig = require("./config/webpack")
    sourceFiles = [
      "src/coffee/**/*.coffee"
      "src/coffee/**/*.cjsx"
    ]
    gulp.src sourceFiles
      .pipe gulpWebpack(webpackConfig)
      .pipe gulp.dest("public/js/")

do (desc = "build css")->
  gulp.task "style.css", ->
    concat  = require("gulp-concat")
    sass    = require("gulp-sass")
    gulp.src ["src/sass/**/*.sass"]
      .pipe sass
        indentedSyntax: true
      .pipe concat("style.css")
      .pipe gulp.dest("public/css/")

gulp.task "build", ["app.js", "style.css"]

gulp.task "watch", ->
  sourceFiles = [
    "src/coffee/**/*.coffee"
    "src/coffee/**/*.cjsx"
  ]
  gulp.watch ["src/sass/**/*.sass"], ["style.css"]
  gulp.watch sourceFiles, ["app.js"]

