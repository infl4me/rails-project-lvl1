# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end

  User = Struct.new(:name, :job, keyword_init: true)

  #
  # generates form
  #
  # @param [User] user user
  # @param [Hash] params params
  #
  # @return [String] form
  #
  def self.form_for(_user, params = {})
    action = params[:url] || '#'
    attribs = Tag.build_attributes({ action: action, method: 'post' })

    "<form#{attribs}>\n</form>"
  end
end
