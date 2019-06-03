# frozen_string_literal: true

require 'jekyll'
require 'jekyll-katex/lib_root'

module Jekyll
  module Katex
    # For holding configuration values specific to the jekyll-katex plugin
    class Configuration
      LOG_TOPIC = 'Katex Configuration:'
      CONFIG_DEFAULTS = {
        'js_filename' => 'katex.min.js',
        'js_path' => File.join(Jekyll::Katex::LIB_ROOT, 'assets', 'js'),
        'rendering_options' => {
          'throw_error' => true,
          'error_color' => '#cc0000'
        }
      }.freeze

      JEKYLL_CONFIG = Jekyll.configuration['katex'] || {}

      # Merge the configurations (it would be nicer if there would be a "deep"
      # merge operation for Hashes, instead we just merge the nested
      # rendering_options Hash manually)
      CONFIG = CONFIG_DEFAULTS.merge(JEKYLL_CONFIG)
      CONFIG['rendering_options'] = CONFIG_DEFAULTS['rendering_options'].merge(JEKYLL_CONFIG['rendering_options'] || {})

      def self.js_path
        js_filename = CONFIG['js_filename']
        js_path = CONFIG['js_path']

        katex_js = Dir.glob(File.join(js_path, '**', js_filename)).first

        raise 'Could not find KaTeX javascript file using provided configuration.' if katex_js.nil?

        Jekyll.logger.info LOG_TOPIC, "Found KaTeX js at: #{katex_js}"
        katex_js
      end

      def self.global_rendering_options
        {
          throwOnError: CONFIG['rendering_options']['throw_error'],
          errorColor: CONFIG['rendering_options']['error_color']
        }
      end
    end
  end
end
