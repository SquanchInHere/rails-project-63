# frozen_string_literal: false

require_relative 'hexlet_code/version'

# Hexlet module for form generate
module HexletCode
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :FormRenderer, 'hexlet_code/form_renderer'
  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    form_builder = FormBuilder.new(entity, attributes)
    yield(form_builder) if block_given?
    FormRenderer.render_html(form_builder)
  end
end
