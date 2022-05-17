# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  @user = HexletCode::User.new name: 'rob'

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_builds_form
    result = HexletCode.form_for @user
    assert_equal("<form action=\"#\" method=\"post\">\n</form>", result)

    result = HexletCode.form_for @user, url: '/users'
    assert_equal("<form action=\"/users\" method=\"post\">\n</form>", result)
  end
end
