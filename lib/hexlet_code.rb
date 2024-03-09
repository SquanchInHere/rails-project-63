# frozen_string_literal: false

require_relative 'hexlet_code/version'

# Hexlet module for form generate
module HexletCode
  autoload :Tag, 'classes/tag'
  class Error < StandardError; end

  def self.form_for(user, **attributes)
    attributes[:method] = 'post' if attributes[:method].nil?
    attributes[:url] = '#' if attributes[:url].nil?
    tag = Tag.new(user)
    tag.build('form', **attributes) { yield tag if block_given? }
  end
end
