# frozen_string_literal: true

require 'jekyll'
require 'jekyll-katex/lib_root'

module Jekyll
  module Katex
    # For holding configuration values specific to the jekyll-katex plugin
    class Configuration
      LOG_TOPIC = 'Katex Configuration:'
      CONFIG_DEFAULTS = {
        js_filename: 'katex.min.js',
        js_path: File.join(Jekyll::Katex::LIB_ROOT, 'assets/js/'),
        rendering_options: {
          throw_error: true,
          error_color: '#cc0000'
        }
      }.freeze

      JEKYLL_CONFIG = Jekyll.configuration['katex'] || {}

      def self.js_path
        js_filename = JEKYLL_CONFIG['js_filename'] || CONFIG_DEFAULTS[:js_filename]
        js_path = JEKYLL_CONFIG['js_path'] || CONFIG_DEFAULTS[:js_path]

        katex_js = Dir.glob("#{js_path}/**/#{js_filename}").first
        raise 'Could not find KaTeX javascript file using provided configuration.' if katex_js.nil?
        Jekyll.logger.info LOG_TOPIC, "Found KaTeX js at: #{katex_js}"
        katex_js
      end

      def self.global_rendering_options
        {
          throwOnError: JEKYLL_CONFIG['throw_error'] || CONFIG_DEFAULTS[:throw_error],
          errorColor: JEKYLL_CONFIG['error_color'] || CONFIG_DEFAULTS[:error_color]
        }
      end
    end
  end
end
