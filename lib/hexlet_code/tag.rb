# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build_attributes(attributes = {})
      attributes
        .map { |key, value| " #{key}=\"#{value}\"" }
        .join
    end

    def self.build(name, attributes = {})
      attributes = build_attributes(attributes)
      body = yield if block_given?
      
      return "<#{name}#{attributes}>" if body.nil?

      "<#{name}#{attributes}>#{body}</#{name}>"
    end
  end
end
