# frozen_string_literal: true

module HexletCode
  module FormFields
    class Label
      include Renderable

      def initialize(args)
        _, property = args

        @name = 'label'
        @attributes = {
          for: property
        }
        @body = property.capitalize
      end
    end
  end
end
