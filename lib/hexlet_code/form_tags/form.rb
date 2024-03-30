# frozen_string_literal: true

module HexletCode
  # Forms attributes
  class Form
    # default form actions
    ACTION = '#'

    # default form method
    METHOD = 'post'

    attr_reader :tag, :options

    # prepare form options
    def initialize(options)
      @tag = :form
      @options = {
        action: options.fetch(:url, ACTION),
        method: options.fetch(:method, METHOD)
      }.merge(options.except(:url, :method))
    end
  end
end
