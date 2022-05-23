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
      Tag.build('form', form_attributes) { fields.join }
    end
  end
end
