# frozen_string_literal: true

require 'test_helper'

class FormTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_it_builds_basic_form
    user = User.new name: 'rob'
    result = HexletCode.form_for user
    assert_equal(TestHelper.read_fixture('form_minimal.html'), result)

    result = HexletCode.form_for user, url: '/users'
    assert_equal(TestHelper.read_fixture('form_with_url.html'), result)
  end

  def test_it_builds_form_with_block
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    result = HexletCode.form_for user do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, cols: 20, rows: 40
      f.submit
    end

    assert_equal(TestHelper.read_fixture('form.html'), result)
  end

  def test_should_throw_if_undefined_field_specified
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    assert_raises(StandardError) do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age # undefined field "age"
      end
    end
  end
end
