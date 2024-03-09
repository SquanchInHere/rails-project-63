# frozen_string_literal: true

class Tag
  def initialize(data)
    @data = data
    @tags ||= []
    @textarea_attr = { cols: 20, rows: 40 }
  end

  def build(tag_name, **attributes)
    attributes = { action: attributes.delete(:url) }.merge(attributes) unless attributes[:url].nil?
    tag_content = attributes.delete(:text) || ''
    attributes_string = attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')

    @tags << "<#{tag_name} #{attributes_string}"

    @tags << case tag_name
             when 'input' then '>'
             else ">#{tag_content}"
             end

    yield if block_given?
    @tags << "</#{tag_name}>" if tag_name != 'input'
    @tags.join
  end

  def input(argument, **attributes)
    attributes = prepare_input_attributes(argument, attributes)
    as = attributes.delete(:as) || ''
    input_value = get_input_data(argument)

    as == :text ? build_textarea(attributes, input_value) : build_input(attributes, input_value, as)
  end

  def submit(button_name = 'Save')
    build('input', type: 'submit', value: button_name)
  end

  private

  def build_textarea(attributes, value)
    attributes[:cols] ||= @textarea_attr[:cols]
    attributes[:rows] ||= @textarea_attr[:rows]
    attributes[:text] = value
    puts attributes
    build('textarea', **attributes)
  end

  def build_input(attributes, value, as)
    attributes[:type] = as.empty? ? :text : as
    attributes[:value] = value
    build('input', **attributes)
  end

  def build_label(attributes)
    for_attr = attributes[:name]
    text = attributes[:name].to_s.capitalize
    label_attr = { for: for_attr, text: text }
    build('label', **label_attr)
  end

  def prepare_input_attributes(argument, attributes)
    input_attributes = { name: argument }
    build_label(input_attributes)
    input_attributes.merge(attributes)
  end

  def get_input_data(argument)
    @data.public_send(argument)
  rescue NoMethodError => e
    raise e.class
  end
end
