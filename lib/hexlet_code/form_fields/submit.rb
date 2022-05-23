# frozen_string_literal: true

module HexletCode
  module FormFields
    class Submit
      include Renderable

      def initialize(value, attributes = {})
        @name = 'input'
        @attributes = {
          type: 'submit',
          value: value
        }.merge(attributes)
      end
    end
  end
end
