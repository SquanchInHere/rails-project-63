# frozen_string_literal: true

# HexcletCode module
module HexletCode
  # Inputs base module
  module Inputs
    # Text area prepare input
    class TextInput < BaseInput
      # Default textarea COLS size
      COLS = 20

      # Default textarea ROWS size
      ROWS = 40

      private

      # Prepare textarea attributes
      def input
        [
          input_label,
          {
            tag: :textarea,
            value: @input[:value],
            options: prepare_options(@input[:options])
          }
        ]
      end

      # Textarea options prepare
      def prepare_options(options)
        {
          name: @input[:name],
          cols: options.fetch(:cols, COLS),
          rows: options.fetch(:rows, ROWS)
        }.merge(options)
      end
    end
  end
end
