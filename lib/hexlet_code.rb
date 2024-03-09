# frozen_string_literal: false

require_relative "hexlet_code/version"

module HexletCode
  autoload :Tag, 'classes/tag'
  class Error < StandardError; end

  def self.form_for(user, url: '#')
    tag = Tag.new(user)
    tag.build('form', action: url, method: 'post') { yield tag if block_given? }
  end
end