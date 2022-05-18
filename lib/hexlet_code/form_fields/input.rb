# frozen_string_literal: true

module HexletCode
  module FormFields
    class Input
      include Printable

      def initialize(name, value, attributes = {})
        @name = 'input'
        @attributes = {
          name: name,
          type: 'text',
          value: value
        }.merge(attributes)
      end
    end
  end
end
