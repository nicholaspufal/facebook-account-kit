# Facebook::AccountKit

This gem aims to facilitate the communication with Facebook's Account Kit. It implements the **server side** described in the [official docs](https://developers.facebook.com/docs/accountkit/web).

As of now it's assuming you have enabled `Require app secret` in your Account Kit page.

It only uses the core modules available as part of Ruby (so nothing too crazy in here 😬...)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'facebook-account-kit'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install facebook-account-kit

## Usage

Somewhere in your application (probably as part of a new `initializer`) you should add the following:

```ruby
  require 'facebook/account_kit'

  Facebook::AccountKit.config do |c|
    c.account_kit_version = 'v1.0' # or any other valid account kit api version
    c.account_kit_app_secret = 'your account kit secret'
    c.facebook_app_id = 'your facebook app id'
  end
```

All of that information you can find as part of your Facebook app's `dashboard` and `account kit` pages.

The process of communicating with Facebook is divided into two steps.

During the first one you will use the `code` (AKA `authorization code`) that the client provided in exchange for an `access_token`:

```ruby
  client_code = params[:code] # this depends on how your controller was implemented
  token_exchanger = Facebook::AccountKit::TokenExchanger.new(client_code)
  access_token = token_exchanger.fetch_access_token
```

...and with that access token you can request for the user information:

```ruby
  user = Facebook::AccountKit::UserAccount.new(access_token)
  user.fetch_user_info
```

## Development

There are different targets in the Makefile to help you to run the tests:

* Run all tests: `make test`
* Run unit tests: `make test.unit`
* Run integration tests: `make test.integration`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicholaspufal/facebook-account-kit

