gulp         = require 'gulp'
stylus       = require 'gulp-stylus'
plumber      = require 'gulp-plumber'
spritesmith  = require 'gulp.spritesmith'
pleeease     = require 'gulp-pleeease'
minifyCss    = require 'gulp-minify-css'
rename       = require 'gulp-rename'
coffee       = require 'gulp-coffee'
jade         = require 'gulp-jade'
connect      = require 'gulp-connect'
bowerFiles   = require 'main-bower-files'
uglify       = require 'gulp-uglify'
browserify   = require 'browserify'
debowerify   = require 'debowerify'
vueify       = require 'vueify'
source       = require 'vinyl-source-stream'


# Stylus
gulp.task 'stylus', ->
  gulp.src            [
    './src/styles/stylus/*.styl'
  ]
  .pipe stylus()
  .pipe pleeease()
  .pipe minifyCss     keepSpecialComments: 0
  .pipe rename        extname: '.min.css'
  .pipe gulp.dest     './dest/styles/'
  .pipe connect.reload()


# Css library
gulp.task 'lib-css', ->
  gulp.src            './src/styles/*.css'
  .pipe minifyCss     keepSpecialComments: 0
  .pipe rename        extname: '.min.css'
  .pipe gulp.dest     './dest/styles'


# Webfont
gulp.task 'fonts', ->
  gulp.src [
    './src/images/fonts/*.eot'
    './src/images/fonts/*.svg'
    './src/images/fonts/*.tiff'
    './src/images/fonts/*.woff'
  ]
  .pipe gulp.dest './dest/fonts'


# Sprite image
gulp.task 'sprite', ->
  spriteData = gulp.src ['./src/images/sprites/*.*']
  .pipe plumber()
  .pipe spritesmith {
    imgName: 'sprite.png'
    imgPath: '/images/sprite.png'
    cssName: 'sprites.styl'
    cssFormat: 'stylus'
    padding: 10
  }

  spriteData.img.pipe gulp.dest('./dest/images/')
  spriteData.css.pipe gulp.dest('./src/styles/stylus/_mixins/')

# Images
gulp.task 'images', ->
  gulp.src [
    './src/images/*.*'
    './src/images/samples/*.*'
    './src/images/components/*.*'
  ]
  .pipe gulp.dest './dest/images'

# Jade
gulp.task 'jade', ->
  gulp.src      [
    './src/jade/!(_)*.jade'
  ]
  .pipe jade
    pretty:     true
    basedir:    '.src/jade'
  .pipe gulp.dest     './dest'
  .pipe connect.reload()



# Browserify Javascript/CoffeeScript
gulp.task 'script', ->
  browserify
    entries: [
      './src/scripts/app.coffee'
    ]
    extensions: ['.coffee']
  .transform 'coffeeify'
  .transform 'debowerify'
  .transform 'vueify'
  .bundle()
  .pipe source 'app.js'
  .pipe gulp.dest "./dest/scripts/"
  .pipe connect.reload()


  
# Bower
gulp.task 'bower', ->
  gulp.src bowerFiles()
  .pipe gulp.dest './dest/lib'
  gulp.start 'fonts', 'lib-css'


# Connect local Server
gulp.task 'connect', ->
  connect.server
    root: 'dest',
    port: 8000,
    livereload: true

    
# Task watch
gulp.task 'watch', ->
  gulp.watch "./src/styles/stylus/**/*.styl", ['stylus']
  gulp.watch "./src/jade/**/*.jade",['jade']
  gulp.watch "./src/scripts/**/*.*", ['script']


# do
gulp.task 'default', [
    'bower'
    'sprite'
    'images'
    'lib-css'
    'stylus'
    'jade'
    'script'
    'connect'
    'watch'
]