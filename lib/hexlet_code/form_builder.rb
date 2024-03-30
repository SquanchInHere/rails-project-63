# frozen_string_literal: true

# Hexlet form builder module
module HexletCode
  # Form builder class
  class FormBuilder
    attr_reader :form_body

    def initialize(entity, attributes)
      @entity = entity
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: attributes
      }
    end

    def input(name, options = {})
      @form_body[:inputs].concat prepare_input_attributes(name, options)
    end

    def submit(name = 'Save', attributes = {})
      submit = HexletCode::Inputs::SubmitInput.new({ value: name }.merge({ options: attributes })).input_body
      @form_body[:submit] = submit
    end

    private

    def prepare_input_attributes(argument, options)
      input_type = options.fetch(:as, 'string')
      class_name = "#{type.capitalize}Input"
      input_options = {
        name: argument,
        value: @entity.public_send(argument),
        type: input_type,
        options: options.except(:as).sort.to_h
      }

      HexletCode::Inputs.const_get(class_name).new(input_options).input_body
    end
  end
end
