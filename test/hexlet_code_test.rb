# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_builds_single_tage
    assert_equal('<br>', HexletCode::Tag.build('br'))

    assert_equal('<img src="path/to/image">', HexletCode::Tag.build('img', src: 'path/to/image'))

    assert_equal('<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save'))
  end
end
