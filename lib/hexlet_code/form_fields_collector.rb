# frozen_string_literal: true

module HexletCode
  class FormFieldsCollector
    attr_reader :fields

    def initialize(model)
      @model = model
      @fields = []
    end

    def insert(field)
      @fields << field
    end

    def label(name, params = {})
      insert HexletCode::FormFields::Label.new(name, params)
    end

    def input(name, params = {})
      return textarea(name, params.reject { |key| key == :as }) if params[:as] == :text

      label(name)

      insert HexletCode::FormFields::Input.new(name, @model.public_send(name), params)
    end

    def textarea(name, params = {})
      label(name)

      insert HexletCode::FormFields::Textarea.new(name, @model.public_send(name), params)
    end

    def submit(value = 'Save', params = {})
      insert HexletCode::FormFields::Submit.new(value, params)
    end
  end
end
