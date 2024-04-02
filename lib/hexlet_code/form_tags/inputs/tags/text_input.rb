# frozen_string_literal: true

# HexcletCode module
module HexletCode
  # Inputs base module
  module Inputs
    # Text area prepare input
    class TextInput < BaseInput
      COLS = 20
      ROWS = 40

      private

      def input
        [
          label_body,
          {
            tag: :textarea,
            value: @input[:value],
            options: prepare_options(@input[:options])
          }
        ]
      end

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
