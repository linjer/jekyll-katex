require 'execjs'

module Jekyll
  module Tags
    class Katex < Liquid::Block

      KATEX_JS_PATH = File.join(Jekyll::Katex::LIB_ROOT, 'assets/js/katex.min.js')

      def initialize(tag_name, markup, tokens)
        super
        @tokens = tokens
        @markup = markup

        @display = markup.include? 'display'
        @katex = ExecJS.compile(open(KATEX_JS_PATH).read)
      end

      def render(context)
        latex_source = super
        @katex.call("katex.renderToString", latex_source, displayMode: @display)
      end
    end
  end
end
2
