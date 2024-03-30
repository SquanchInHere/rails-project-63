# frozen_string_literal: true

module HexletCode
  # Inputs builder
  module Inputs
    autoload :TextInput, 'hexlet_code/form_tags/inputs/tags/text_input'
    autoload :BaseInput, 'hexlet_code/form_tags/inputs/tags/base_input'
    autoload :StringInput, 'hexlet_code/form_tags/inputs/tags/string_input'
    autoload :SubmitInput, 'hexlet_code/form_tags/inputs/tags/submit_input'
    autoload :InputLabel, 'hexlet_code/form_tags/inputs/tags/label/input_label'
  end
end
