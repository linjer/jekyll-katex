
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'jekyll-katex/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-katex'
  spec.version       = Jekyll::Katex::VERSION
  spec.authors       = ['Jerry Lin']
  spec.email         = 'linjer@gmail.com'

  spec.summary       = 'Jekyll plugin for easy KaTeX math server-side rendering.'
  spec.description   = 'Adds a liquid tag you can use to do server-side rendering of latex math using KaTeX'
  spec.homepage      = 'https://github.com/linjer/jekyll-katex'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "'http://mygemserver.com'"
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) } <<
                       spec.bindir = 'bin'
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.1'

  spec.add_runtime_dependency 'execjs', '~> 2.7'
  spec.add_runtime_dependency 'jekyll', '~> 3.8'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.56.0'
  spec.add_development_dependency 'simplecov', '~> 0.16'
end
