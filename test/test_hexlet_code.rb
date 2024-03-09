# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    user = Struct::new('User', :name, :job, keyword_init: true)
    @user = user.new name: 'rob', job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for_user_with_url
    form = ::HexletCode.form_for(@user, url: '/users') do |f|
    end
    assert_equal '<form action="/users" method="post"></form>', form
  end

  def test_witout_url_form_for_user
    form = ::HexletCode.form_for(@user) do |f|
    end
    assert_equal '<form action="#" method="post"></form>', form
  end

  def test_form_with_user_input_not_empty_args
    form = ::HexletCode.form_for(@user, url: '/users') do |f|
      f.input :name
      f.input :job, as: 'text', cols: 20, rows: 40
    end

    assert_equal '<form action="/users" method="post"><input name="name" type="text" value="rob"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>', form
  end

  def test_user_from_with_label
    form = ::HexletCode.form_for(@user, method: :get, class: 'hexlet-form') do |f|
      f.input :name, with_tag: 'label', for: 'name', text: "Name"
      f.input :job, with_tag: 'label'
      f.submit 'Wow'
    end

    assert_equal '<form action="#" method="get" class="hexlet-form"><label for="name">Name</label><input name="name" type="text" value="rob"><label for="job">Job</label><input name="job" type="text" value="hexlet"><input type="submit" value="Wow"></form>', form
  end
end
