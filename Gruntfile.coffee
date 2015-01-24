#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig
    copy:
      modernizr:
        files: [{
          expand: true
          cwd: "bower_components/modernizr/"
          src: "modernizr.js"
          dest: "js/"
        }]
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist"
          src: "jquery.min.js"
          dest: "js/"
        }]
      foundation:
        files: [{
          expand: true
          cwd: "bower_components/foundation/js"
          src: "foundation.min.js"
          dest: "js/"
        }]

    sass:
      options:
        includePaths: ['bower_components/foundation/scss']
      dist:
        options:
          outputStyle:  'compressed'
        files:  'css/app.css': 'scss/app.scss'
    exec:
      jekyll:
        cmd: "jekyll build --trace"
      jekyll_serve:
        cmd: "jekyll serve "
    watch:
      grunt:
        files: ['Gruntfile.coffee']
      sass:
          files: 'scss/**/*.scss',
          tasks: ['sass']


  grunt.registerTask "build", [
    "sass"
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "exec:jekyll_serve"
  ]

  grunt.registerTask "default", [
    "build"
    "watch"
  ]