# frozen_string_literal: true

# Hexlet form builder module
module HexletCode
  # Form render class
  class FormRenderer
    def self.render_html(params)
      form = HexletCode::Form.new(params[:form_options])
      Tag.new.build(form.tag, form.options) do
        inputs = inputs_render params[:inputs]
        inputs << submit_render(params[:submit][:options]) unless params[:submit][:options].nil?
        inputs
      end
    end

    def self.inputs_render(inputs)
      inputs.map { |v| Tag.new.build(v[:tag], v[:options]) { v.fetch(:value, '') } }.join
    end

    def self.submit_render(options)
      Tag.new.build(:input, options)
    end

    private_class_method :inputs_render, :submit_render
  end
end
