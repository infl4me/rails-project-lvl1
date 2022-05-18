# frozen_string_literal: true

module HexletCode
  module Form
    def form_for(model, params = {})
      fields = if block_given?
                 form_fields_collector = FormFieldsCollector.new(model)
                 yield(form_fields_collector)
                 form_fields_collector.fields
               else
                 []
               end

      form_attributes = { action: params[:url] || '#', method: 'post' }
      Tag.build('form', form_attributes) { convert_fields_to_html(fields) }
    end

    def convert_fields_to_html(fields)
      stringified_fields = fields.map do |field|
        tag = Tag.build(field[:type], field[:attributes]) { field[:body] }
        "  #{tag}"
      end.join("\n")

      stringified_fields.empty? ? '' : "\n#{stringified_fields}\n"
    end
  end
end
