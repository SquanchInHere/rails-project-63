# frozen_string_literal: true

# HexcletCode module
module HexletCode
  # Inputs base module
  module Inputs
    # Submit class prepare input
    class SubmitInput < BaseInput
      TYPE = :submit

      private

      # Prepare submit options
      def input
        {
          tag: :input,
          options: {
            type: TYPE,
            value: @input[:value]
          }.merge(@input[:options])
        }
      end
    end
  end
end
