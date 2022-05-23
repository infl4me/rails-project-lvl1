# frozen_string_literal: true

module HexletCode
  module FormFields
    class Textarea
      include Renderable

      def initialize(args)
        model, property, attributes = args
        @name = 'textarea'
        @has_label = true
        @attributes = {
          name: property
        }.merge(attributes)
        @body = model.public_send(property)
      end
    end
  end
end
