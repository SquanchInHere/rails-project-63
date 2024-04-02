# frozen_string_literal: false

require_relative 'hexlet_code/version'

# Hexlet module for form generate
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form_tags/form'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :FormRenderer, 'hexlet_code/form_renderer'
  autoload :Inputs, 'hexlet_code/form_tags/inputs/inputs'
  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    form_builder = FormBuilder.new(entity, attributes)
    yield(form_builder) if block_given?
    FormRenderer.render_html(form_builder.form_body)
  end
end

user = Struct.new('User', :name, :job, keyword_init: true)
user = user.new name: 'rob', job: 'hexlet'

form = ::HexletCode.form_for(user, url: '/users') do |f|
  f.input :job, as: :text, cols: 200, rows: 40
  f.input :name
  f.submit 'Saves', class: 'form-button'
end

puts form