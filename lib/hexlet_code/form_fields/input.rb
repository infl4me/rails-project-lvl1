# frozen_string_literal: true

module HexletCode
  module FormFields
    class Input
      include Renderable

      def initialize(args)
        model, property, attributes = args

        @name = 'input'
        @has_label = true
        @attributes = {
          name: property,
          type: 'text',
          value: model.public_send(property)
        }.merge(attributes || {})
      end
    end
  end
end
