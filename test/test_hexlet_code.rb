# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def setup
    user = Struct.new('User', :name, :job, keyword_init: true)
    @user = user.new name: 'rob', job: 'hexlet'
  end

  def read_fixture(name)
    File.read("test/fixtures/#{name}.html")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for_user_with_url
    form = ::HexletCode.form_for(@user, url: '/users')
    assert_equal read_fixture('test_form_for_user_with_url'), form
  end

  def test_witout_url_form_for_user
    form = ::HexletCode.form_for(@user)
    assert_equal read_fixture('test_witout_url_form_for_user'), form
  end

  def test_form_input_with_args
    form = ::HexletCode.form_for(@user, url: '/users') do |f|
      f.input :job, as: :text, cols: 20, rows: 40
    end

    assert_equal read_fixture('test_form_input_with_args'), form
  end

  def test_user_from_with_input
    form = ::HexletCode.form_for(@user, method: :get, class: 'hexlet-form') do |f|
      f.input :name, class: 'user-input'
    end

    assert_equal read_fixture('test_user_from_with_input'), form
  end

  def test_user_from_with_submit
    form = ::HexletCode.form_for(@user, method: :get, class: 'hexlet-form') do |f|
      f.submit 'Wow'
    end

    assert_equal read_fixture('test_user_from_with_submit'), form
  end
end
