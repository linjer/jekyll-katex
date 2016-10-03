require "bundler/gem_tasks"

task default: :build

task :katex_npm_i do
  sh 'npm', 'i'
  cp 'node_modules/katex/dist/katex.min.js', 'lib/assets/js/katex.min.js'
end

task :build => [:katex_npm_i] do
  sh 'gem', 'build', 'jekyll-katex.gemspec'
end
