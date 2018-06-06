# frozen_string_literal: true

require 'jekyll'

require 'jekyll-katex/version'
require 'jekyll-katex/lib_root'
require 'jekyll/tags/katex'

Liquid::Template.register_tag('katex', Jekyll::Tags::Katex)
