# frozen_string_literal: true

module HexletCode
  module FormFields
    module Printable
      attr_reader :name, :attributes, :body

      def to_html
        HexletCode::Tag.build(@name, @attributes) { @body }
      end
    end
  end
end
