# frozen_string_literal: true

module HexletCode
  # Forms attributes
  class Form
    ACTION = '#'
    METHOD = 'post'

    attr_reader :tag, :options

    def initialize(options)
      @tag = :form
      @options = {
        action: options.fetch(:url, ACTION),
        method: options.fetch(:method, METHOD)
      }.merge(options.except(:url, :method))
    end
  end
end
