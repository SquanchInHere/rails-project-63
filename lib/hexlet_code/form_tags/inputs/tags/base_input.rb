# frozen_string_literal: true

# HexcletCode module
module HexletCode
  # Inputs base module
  module Inputs
    # Base inputs class
    class BaseInput
      autoload :InputLabel, 'hexlet_code/form_tags/inputs/tags/label/input_label'

      def initialize(input)
        @input = input
      end

      # Return inputs hash
      def input_body
        input
      end

      private

      # Get Label options for input
      def input_label
        InputLabel.new(@input).label_body
      end
    end
  end
end
