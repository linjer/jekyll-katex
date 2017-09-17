require "bundler/gem_tasks"

task default: :build

task :js_i do
  sh 'yarn', 'install'
  cp 'node_modules/katex/dist/katex.min.js', 'lib/assets/js/katex.min.js'
end

task build: [:js_i] do
  sh 'gem', 'build', 'jekyll-katex.gemspec'
end

task push: [:build] do
  sh 'gem', 'push', "jekyll-katex-#{Jekyll::Katex::VERSION}.gem"
end
