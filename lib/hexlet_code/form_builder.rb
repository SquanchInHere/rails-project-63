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
      @fields << prepare_input_attributes(name, attributes)
    end

    def label(name)
      @fields << { type: :label, attributes: { for: name, value: name.to_s.capitalize } }
    end

    def submit(name = 'Save')
      @fields << { type: :input, attributes: { type: :submit, value: name } }
    end

    private

    def prepare_input_attributes(argument, attributes)
      as = attributes.delete(:as) || ''
      input_attribute = { name: argument }
      input_attribute[:value] = get_input_data(argument)
      input_attribute[:type] = as.empty? ? :text : as if as != :text
      input_attribute.merge!(attributes)
      input = { type: :input, name: argument, attributes: input_attribute }
      as == :text ? textarea_params(attributes, input_attribute) : input
    end

    def textarea_params(argument, attributes)
      attributes[:cols] ||= @textarea_size[:cols]
      attributes[:rows] ||= @textarea_size[:rows]
      params = attributes.sort_by { |key, _| %i[name cols rows].index(key) || attributes.length }.to_h
      { type: :textarea, name: argument, attributes: params }
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
