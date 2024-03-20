# frozen_string_literal: true

# Form render
module HexletCode
  # Class for building html form
  class Tag
    def initialize
      @tags = []
    end

    def build(tag_name, attributes = {})
      tag_content = attributes.delete(:value) || '' if tag_name != :input
      attributes_string = attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      @tags << "<#{tag_name} #{attributes_string}"
      @tags << case tag_name when :input then '>' else ">#{tag_content}" end
      yield if block_given?
      @tags << "</#{tag_name}>" if tag_name != :input
      @tags.join
    end
  end
end
