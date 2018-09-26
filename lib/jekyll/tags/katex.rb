# frozen_string_literal: true

require 'jekyll-katex/configuration'
require 'jekyll-katex/katex_js'

module Jekyll
  module Tags
    # Defines the custom Liquid tag for compile-time rendering of KaTeX math
    #   {% katex %}
    #   <latex math>
    #   {% endkatex %}
    class Katex < Liquid::Block
      LOG_TOPIC = 'Katex Block:'
      KATEX ||= Jekyll::Katex::KATEX_JS

      def initialize(tag_name, markup, tokens)
        super
        @markup = markup
        @tokens = tokens
        @display = markup.include? 'display'
      end

      def render(context)
        latex_source = super
        rendering_options = Jekyll::Katex::Configuration.global_rendering_options.merge(displayMode: @display)
        KATEX.call('katex.renderToString', latex_source, rendering_options)
      end
    end
  end
end
