# frozen_string_literal: true

# HexcletCode module
module HexletCode
  # Inputs base module
  module Inputs
    # Base inputs class
    class BaseInput
      def initialize(input)
        @input = input
      end

      def input_body
        input
      end

      private

      def label_body
        {
          tag: :label,
          value: @input[:name].to_s.capitalize,
          options: {
            for: @input[:name]
          }
        }
      end
    end
  end
end
