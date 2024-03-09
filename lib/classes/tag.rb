# frozen_string_literal: true

class Tag
  def initialize(data)
    @data = data
    @tags ||= []
    @textarea_attr = { cols: 20, rows: 40 }
  end

  def build(tag_name, **attributes)
    tag_content = attributes.delete(:content) || ''
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
    attributes = { name: argument }.merge(attributes)
    input_value = get_input_data(argument)
    as = attributes.delete(:as) || ''

    unless attributes[:label].nil?
      label_attr = { for: argument, content: attributes[:label].empty? ? argument.capitalize : attributes[:label] }
      attributes.delete(:label)
      label_for_input argument, **label_attr
    end

    if as == 'text'
      attributes[:cols] = @textarea_attr[:cols] if attributes[:cols].nil?
      attributes[:rows] = @textarea_attr[:rows] if attributes[:rows].nil?
      attributes[:content] = input_value
      puts attributes
      build('textarea', **attributes)
    else
      attributes[:type] = as.empty? ? 'text' : as
      attributes[:value] = input_value
      build('input', **attributes)
    end
  end

  def submit(button_name = 'Save')
    build('input', type: 'submit', value: button_name)
  end

  def label_for_input(input_name, **attributes)
    build( 'label', **attributes)
  end

  private

  def get_input_data(argument)
    @data.public_send(argument)
  rescue NoMethodError => e
    puts "#{e.class}: #{e.message}"
    exit
  end
end
