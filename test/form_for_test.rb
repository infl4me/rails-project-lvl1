# frozen_string_literal: true

require 'test_helper'

class FormForTest < Minitest::Test
  def test_it_builds_basic_form
    user = HexletCode::User.new name: 'rob'
    result = HexletCode.form_for user
    assert_equal('<form action="#" method="post"></form>', result)

    result = HexletCode.form_for user, url: '/users'
    assert_equal('<form action="/users" method="post"></form>', result)
  end

  def test_it_builds_form_with_block
    user = HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm'
    result = HexletCode.form_for user do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, cols: 20, rows: 40
      f.submit
    end

    expected = File.read(File.join(__dir__, 'fixtures', 'form.html'))

    assert_equal(expected, result)
  end

  def test_should_throw_if_undefined_field_specified
    user = HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm'

    assert_raises(StandardError) do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age # undefined field "age"
      end
    end
  end
end
