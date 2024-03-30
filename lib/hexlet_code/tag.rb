# frozen_string_literal: true

# Form render
module HexletCode
  # Class for building html form
  class Tag
    # Single html tags
    SINGLE_TAGS = %i[br img input hr].freeze

    # Init tags
    def initialize
      @tags = []
    end

    # Build html tags
    def build(tag_name, attributes)
      attributes_string = attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      @tags << "<#{tag_name} #{attributes_string}>"
      @tags << yield if block_given? && !yield.is_a?(Array)
      @tags << "</#{tag_name}>" unless SINGLE_TAGS.include? tag_name.to_sym
      @tags.join
    end
  end
end
