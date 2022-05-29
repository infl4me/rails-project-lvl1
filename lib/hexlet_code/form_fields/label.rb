# frozen_string_literal: true

module HexletCode
  module FormFields
    class Label
      include Renderable

      def initialize(name)
        @name = 'label'
        @attributes = {
          for: name
        }
        @body = name.capitalize
      end
    end
  end
end
