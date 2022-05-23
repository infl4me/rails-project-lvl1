# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build_attributes(attributes = {})
      attributes
        .map { |key, value| %( #{key}="#{value}") }
        .join
    end

    def self.build(name, attributes = {})
      attributes = build_attributes(attributes)
      open_tag = "<#{name}#{attributes}>"
      close_tag = "</#{name}>"
      body = yield if block_given?

      return open_tag if body.nil?

      "#{open_tag}#{body}#{close_tag}"
    end
  end
end
