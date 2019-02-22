# frozen_string_literal: true

require 'jekyll-katex/configuration'
require 'jekyll-katex/katex_js'

module Jekyll
  module Tags
    # Defines the custom Liquid tag for compile-time rendering of KaTeX math.
    # This differs from the katex tag in that it allows use of `$` and `$$` fencing to mark math mode blocks similar to
    # standard latex.
    #   {% katexmm %}
    #   This is a mixed environment where you can write text as normal but fence off latex math using `$`. Escape
    #   using `\$`. For example.
    #   $latex math with \$$
    #   $$display mode latex$$
    #   {% endkatexmm %}
    class KatexMathMode < Liquid::Block
      LOG_TOPIC = 'KatexMathMode:'
      KATEX ||= Jekyll::Katex::KATEX_JS
      LATEX_TOKEN_PATTERN = /(?<!\\)([$]{2}|[$]{1})(.+?)(?<!\\)\1/m.freeze

      def initialize(tag_name, markup, tokens)
        super
        @markup = markup
        @tokens = tokens
        @display_mode_rendering = Jekyll::Katex::Configuration.global_rendering_options.merge(displayMode: true)
        @inline_mode_rendering = Jekyll::Katex::Configuration.global_rendering_options.merge(displayMode: false)
      end

      def render(context)
        enclosed_block = super
        rendered_str = enclosed_block.to_s.gsub(LATEX_TOKEN_PATTERN) do |match|
          display_mode = match.to_s.start_with? '$$'
          rendering_options = display_mode ? @display_mode_rendering : @inline_mode_rendering
          Jekyll.logger.debug LOG_TOPIC, "Rendering matched block - #{match}"
          KATEX.call('katex.renderToString', Regexp.last_match(2), rendering_options)
        end
        # KaTeX should fix escaped `$` within fenced blocks, this addresses instances outside of math mode
        rendered_str.to_s.gsub(/\\[$]/, '$').to_s
      end
    end
  end
end
