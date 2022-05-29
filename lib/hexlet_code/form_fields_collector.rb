# frozen_string_literal: true

module HexletCode
  class FormFieldsCollector
    attr_reader :fields

    def initialize(model)
      @model = model
      @fields = []
    end

    def input(property, params = {})
      value = @model.public_send(property)
      as = params[:as] || 'input'
      klass = Object.const_get("HexletCode::FormFields::#{as.capitalize}")

      insert(HexletCode::FormFields::Label.new(property))
      insert(klass.new(property, value, params.reject { |key| key == :as }))
    end

    def submit(value = nil, params = {})
      insert(HexletCode::FormFields::Submit.new(value, params))
    end

    private

    def insert(field)
      @fields << field
    end
  end
end
