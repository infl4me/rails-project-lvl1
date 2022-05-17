# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

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
      "<#{name}#{build_attributes(attributes)}>"
    end
  end
end
