# frozen_string_literal: true

module HexletCode
  class Tag
    #
    # transforms hash of attributes into the string
    #
    # @param [Hash] attributes attributes
    #
    # @return [String] attributes
    #
    def self.build_attributes(attributes = {})
      attributes
        .map { |key, value| " #{key}=\"#{value}\"" }
        .join
    end

    #
    # builds a tag
    #
    # @param [String] name tag name
    # @param [Hash] attributes attributes
    #
    # @return [String] tag
    #
    def self.build(name, attributes = {})
      return "<#{name}#{build_attributes(attributes)}>#{yield}</#{name}>" if block_given?

      "<#{name}#{build_attributes(attributes)}>"
    end
  end
end
