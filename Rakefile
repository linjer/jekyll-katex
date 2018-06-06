# frozen_string_literal: true

require 'bundler/gem_tasks'

task default: :build

task :js_i do
  sh 'yarn', 'install'
  cp 'node_modules/katex/dist/katex.min.js', 'lib/assets/js/katex.min.js'
end

task build: %i[js_i] do
  sh 'gem', 'build', 'jekyll-katex.gemspec'
end

task clobber: [:clean] do
  rm_rf Rake::FileList.new('*.gem')
end

task :stylecheck do
  sh 'bundle', 'exec', 'rubocop', '--auto-correct'
end

task release: :stylecheck
