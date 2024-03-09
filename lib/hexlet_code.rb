# frozen_string_literal: false

require_relative "hexlet_code/version"

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

user = Struct::new('User', :name, :job, keyword_init: true)
@user = user.new name: 'rob', job: 'hexlet'

form = ::HexletCode.form_for(@user, method: :get, class: 'hexlet-form') do |f|
  f.input :name, with_tag: 'label', for: 'name', text: "Name"
  f.input :job
  f.submit 'Wow'
end

puts form