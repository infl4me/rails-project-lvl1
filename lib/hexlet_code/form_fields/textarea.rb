# frozen_string_literal: true

module HexletCode
  module FormFields
    class Textarea
      include Printable

      def initialize(name, value, attributes = {})
        @name = 'textarea'
        @attributes = {
          name: name
        }.merge(attributes)
        @body = value
      end
    end
  end
end
