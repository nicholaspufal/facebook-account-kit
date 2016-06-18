require 'facebook/account_kit'

Facebook::AccountKit.config do |c|
  c.account_kit_version = 'v1.0'
  c.account_kit_app_secret = 'random_secret'
  c.facebook_app_id = 'random_id'
end

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random
end
