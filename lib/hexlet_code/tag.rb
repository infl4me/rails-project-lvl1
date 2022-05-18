# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build_attributes(attributes = {})
      attributes
        .map { |key, value| " #{key}=\"#{value}\"" }
        .join
    end

    def self.build(name, attributes = {})
      return "<#{name}#{build_attributes(attributes)}>#{yield}</#{name}>" if block_given?

      "<#{name}#{build_attributes(attributes)}>"
    end
  end
end
