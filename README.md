[![Actions Status](https://github.com/SquanchInHere/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/SquanchInHere/rails-project-63/actions)
[![Actions Status](https://github.com/SquanchInHere/rails-project-63/actions/workflows/ci.yml/badge.svg)](https://github.com/SquanchInHere/rails-project-63/actions)
# HexletCode

This project is a library for generating HTML forms in Ruby.

* Create HTML forms using Ruby's convenient and flexible syntax.
* Ability to define form attributes and its elements.
* Supports various types of form elements: text fields, text areas, submit buttons and others.
* Automatic generation of labels for input fields.

## Installation

Add to the application's Gemfile by executing:

    gem 'hexlet_code', '~> 0.4', github: 'SquanchInHere/rails-project-63'

## Usage
An example of using the library to create an HTML form:

    `require 'hexlet_code'

    form = HexletCode.form_for(user, url: '/users') do |f|
        f.input :name
        f.input :email, as: :email
        f.input :bio, as: :text
        f.submit
    end

    puts form`

Example of form structure

    `<form action="/users" method="post">
        <label for="user_name">Name</label>
        <input name="name" value="john doe" type="text">
        <label for="email">Email</label>
        <input name="email" value="johndoe@example.com" type="email">
        <label for="bio">Bio</label>
        <textarea name="bio" cols="20" rows="40">Some bio</textarea>
        <input type="submit" value="Save">
    </form>`

## Contributing

Bug reports and pull requests are welcome on GitHub at [HexletCode](https://github.com/SquanchInHere/hexlet_code).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
