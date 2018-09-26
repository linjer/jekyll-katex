# frozen_string_literal: true

require 'execjs'
require 'jekyll-katex/configuration'

# Holds reference to the katex.min.js lib
module Jekyll
  # Katex fast math rendering, see https://github.com/Khan/KaTeX
  module Katex
    KATEX_JS ||= ExecJS.compile(File.open(Jekyll::Katex::Configuration.js_path).read)
  end
end
