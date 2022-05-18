# frozen_string_literal: true

module HexletCode
  class FormFieldsCollector
    attr_reader :fields

    def initialize(model)
      @model = model
      @fields = []
    end

    def extract_attributes_from_params(params = {})
      params.reject { |key| key == :as }
    end

    def label(name)
      @fields << {
        type: 'label',
        attributes: { for: name },
        body: name.capitalize
      }
    end

    def input(name, params = {})
      return textarea(name, extract_attributes_from_params(params)) if params[:as] == :text

      label(name)

      @fields << {
        type: 'input',
        attributes: {
          name: name,
          type: 'text',
          value: @model.public_send(name)
        }.merge(extract_attributes_from_params(params))
      }
    end

    def textarea(name, params = {})
      label(name)

      @fields << {
        type: 'textarea',
        body: @model.public_send(name),
        attributes: {
          name: name
        }.merge(extract_attributes_from_params(params))
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
