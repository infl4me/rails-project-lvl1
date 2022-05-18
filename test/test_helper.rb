# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

module TestHelper
  def self.read_fixture(name)
    File.read(File.join(__dir__, 'fixtures', name))
  end
end
