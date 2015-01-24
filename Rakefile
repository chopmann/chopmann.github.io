require 'rake'

dir_bower = 'bower_components'
dir_assets = '_assets'
dir_js = File.join(dir_assets, 'javascripts')
dir_css = File.join(dir_assets, 'stylesheets')

desc "copy bower_componets to  _assets"
task :copy do
  puts :one
end

task :default do
  puts "Wellcome to Super Awesome Blog"
end

task :bootstrap do
  bootstrap = File.join(dir_bower, 'bootstrap-sass/assets/')
  files = Rake::FileList["bower_components/bootstrap-sass/assets/**/*"]
  puts files
  puts bootstrap
end