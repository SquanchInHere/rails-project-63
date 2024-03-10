# frozen_string_literal: false

require_relative 'hexlet_code/version'

# Hexlet module for form generate
module HexletCode
  autoload :Tag, 'classes/tag'
  class Error < StandardError; end

  def self.form_for(user, **attributes)
    tag = Tag.new(user)
    form_attributes = tag.prepare_form_attributes(attributes)
    tag.build('form', **form_attributes) { yield tag if block_given? }
  end
end
