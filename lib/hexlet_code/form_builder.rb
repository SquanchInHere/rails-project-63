# frozen_string_literal: true

# Hexlet form builder module
module HexletCode
  # Form builder class
  class FormBuilder
    attr_reader :fields, :form_attributes

    def initialize(entity, attributes)
      @entity = entity
      @fields = []
      @form_attributes = prepare_form_attributes(attributes)
      @textarea_size = { cols: 20, rows: 40 }
    end

    def input(name, attributes = {})
      label(name)
      @fields << prepare_attributes(name, attributes)
    end

    def label(name, attributes = {})
      attributes = { for: name, value: name.to_s.capitalize } if attributes.empty?
      @fields << { type: :label, attributes: attributes }
    end

    def submit(name = 'Save', attributes = {})
      attributes[:type] = :submit
      attributes[:value] = name
      @fields << { type: :input, attributes: attributes }
    end

    private

    def prepare_attributes(argument, attributes)
      input_attribute = { name: argument }
      type = :input
      as = attributes.delete(:as)
      input_attribute[:type] = as || :text if as != :text
      input_attribute[:value] = get_input_data(argument)

      if as == :text
        type = :textarea
        input_attribute.merge!(textarea_attributes(attributes))
      end

      { type: type, name: argument, attributes: input_attribute }
    end

    def prepare_form_attributes(attributes)
      { action: attributes.delete(:url) || '#', method: attributes.delete(:method) || 'post' }.merge(attributes)
    end

    def textarea_attributes(attributes)
      attributes[:cols] ||= @textarea_size[:cols]
      attributes[:rows] ||= @textarea_size[:rows]
      attributes
    end

    def get_input_data(argument)
      @entity.public_send(argument)
    rescue NoMethodError => e
      raise e.class
    end
  end
end