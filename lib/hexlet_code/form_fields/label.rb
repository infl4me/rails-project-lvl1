# frozen_string_literal: true

module HexletCode
  module FormFields
    class Label
      include Renderable

      def initialize(name, attributes = {})
        @name = 'label'
        @attributes = {
          for: name
        }.merge(attributes)
        @body = name.capitalize
      end
    end
  end
end
