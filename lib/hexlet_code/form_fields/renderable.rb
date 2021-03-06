# frozen_string_literal: true

module HexletCode
  module FormFields
    module Renderable
      attr_reader :name, :attributes, :body

      def to_s
        HexletCode::Tag.build(@name, @attributes) { @body }
      end
    end
  end
end
