# frozen_string_literal: true

require 'jekyll'
require 'jekyll/tags/katex'
require 'jekyll/tags/katex_math_mode'

Liquid::Template.register_tag('katex', Jekyll::Tags::Katex)
Liquid::Template.register_tag('katexmm', Jekyll::Tags::KatexMathMode)
