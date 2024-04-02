# frozen_string_literal: true

# HexcletCode module
module HexletCode
  # Inputs base module
  module Inputs
    # String class prepare input
    class StringInput < BaseInput
      TYPE = 'text'

      private

      def input
        [
          label_body,
          {
            tag: :input,
            options: prepare_options(@input[:options])
          }
        ]
      end

      def prepare_options(options)
        {
          name: @input[:name],
          value: @input[:value],
          type: TYPE
        }.merge(options)
      end
    end
  end
end
