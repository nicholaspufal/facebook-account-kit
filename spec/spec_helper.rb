require 'facebook/account_kit'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

Facebook::AccountKit.config do |c|
  c.account_kit_version = 'v1.0'
  c.account_kit_app_secret = '9bdc9ae47c4211b9919a036c1e1bc477'
  c.facebook_app_id = '1168173003250539'
end

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random
end
