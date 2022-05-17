# frozen_string_literal: true

module HexletCode
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def self.form_for(user, params = {})
    fields = if block_given?
               form_fields_collector = FormFieldsCollector.new(user)
               yield(form_fields_collector)
               form_fields_collector.fields
             else
               []
             end

    form_attribs = { action: params[:url] || '#', method: 'post' }
    Tag.build('form', form_attribs) { convert_fields_to_html(fields) }
  end

  def self.convert_fields_to_html(fields)
    stringified_fields = fields.map do |field|
      tag = if field[:nested]
              Tag.build(field[:type], field[:attributes]) { (field[:body]).to_s }
            else
              Tag.build(field[:type], field[:attributes])
            end
      "  #{tag}"
    end.join("\n")

    stringified_fields.empty? ? '' : "\n#{stringified_fields}\n"
  end

  class FormFieldsCollector
    attr_reader :fields

    def initialize(entity)
      @entity = entity
      @fields = []
    end

    def label(name)
      @fields << {
        type: 'label',
        attributes: { for: name },
        nested: true,
        body: name.capitalize
      }
    end

    def input(name, params = {})
      return textarea(name) if params[:as] == :text

      label(name)

      @fields << {
        type: 'input',
        attributes: { name: name, type: 'text', value: @entity.public_send(name) }
      }
    end

    def textarea(name)
      label(name)

      @fields << {
        type: 'textarea',
        attributes: {
          cols: 20,
          rows: 40,
          name: name
        },
        nested: true,
        body: @entity.public_send(name)
      }
    end

    def submit(value = 'Save')
      @fields << {
        type: 'input',
        attributes: { type: 'submit', value: value }
      }
    end
  end
end
