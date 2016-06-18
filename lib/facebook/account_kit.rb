require 'facebook/account_kit/configuration'

module Facebook
  module AccountKit
    def self.config
      yield Configuration
    end
  end
end

require 'facebook/account_kit/version'
require 'facebook/account_kit/token_exchanger'
require 'facebook/account_kit/user_account'
