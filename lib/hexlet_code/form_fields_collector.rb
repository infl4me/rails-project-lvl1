# frozen_string_literal: true

module HexletCode
  class FormFieldsCollector
    attr_reader :fields

    CLASS_MAPPING = {
      input: 'HexletCode::FormFields::Input',
      submit: 'HexletCode::FormFields::Submit',
      text: 'HexletCode::FormFields::Textarea',
      label: 'HexletCode::FormFields::Label'
    }.freeze

    def initialize(model)
      @model = model
      @fields = []
    end

    def insert(field)
      @fields << field
    end

    def respond_to_missing?(_)
      true
    end

    def method_missing(method_name, value = nil, params = {})
      field_name = CLASS_MAPPING[params[:as]] || CLASS_MAPPING[method_name]

      raise "Unknown field: #{method_name}" if field_name.nil?

      new_args = [@model, value, params.reject { |key| key == :as }]

      field = Object.const_get(field_name).new(new_args)
      insert  HexletCode::FormFields::Label.new(new_args) if field.has_label
      insert field
    end
  end
end
