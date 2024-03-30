# frozen_string_literal: true

# Hexlet form builder module
module HexletCode
  # Form render class
  class FormRenderer
    # Render html forms
    def self.render_html(params)
      form = HexletCode::Form.new(params[:form_options])
      Tag.new.build(form.tag, form.options) do
        inputs = inputs_render params[:inputs]
        inputs << Tag.new.build(:input, params[:submit][:options]) unless params[:submit][:options].nil?
        inputs
      end
    end

    # Input render
    def self.inputs_render(inputs)
      inputs.map { |v| Tag.new.build(v[:tag], v[:options]) { v.fetch(:value, '') } }.join
    end

    private_class_method :inputs_render
  end
end
