# frozen_string_literal: true

# Hexlet form builder module
module HexletCode
  # Form render class
  class FormRenderer
    autoload :Tag, 'hexlet_code/tag'

    def self.render_html(builder)
      tag = Tag.new
      tag.build(:form, builder.form_attributes) do
        builder.fields.each do |v|
          value = v[:attributes].delete(:value) || '' if v[:type] != :input
          tag.build(v[:type], v[:attributes]) { value }
        end
      end
    end
  end
end
