module Facebook
  module AccountKit
    class Configuration
      class << self
        attr_accessor :account_kit_version,
                      :account_kit_app_secret,
                      :facebook_app_id
      end
    end
  end
end
