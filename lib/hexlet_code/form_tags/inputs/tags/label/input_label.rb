# frozen_string_literal: true

module HexletCode
  module Inputs
    # Label tag for inputs
    class InputLabel
      def initialize(options)
        @options = options
      end

      # Prepare label body
      def label_body
        {
          tag: :label,
          value: @options[:name].to_s.capitalize,
          options: {
            for: @options[:name]
          }
        }
      end
    end
  end
end
