#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "_assets/vendor/javascripts/"
        }]
      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap-sass/assets/stylesheets/"
          src: ["**/*", "!**/*bootstrap-*.scss"]
          dest: "_assets/vendor/stylesheets/"
        },
          {
            expand: true
            cwd: "bower_components/bootstrap-sass/assets/javascripts/"
            src: ["**/*", "!**/*bootstrap-*.js"]
            dest: "_assets/vendor/javascripts/"
          }]

    exec:
      jekyll:
        cmd: "jekyll build --trace"
      jekyll_serve:
        cmd: "jekyll serve "

  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "exec:jekyll_serve"
  ]

  grunt.registerTask "default", [
    "serve"
  ]