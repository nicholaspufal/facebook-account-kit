require_relative './http'

module Facebook
  module AccountKit
    class TokenExchanger
      def initialize(authorization_code)
        @authorization_code = authorization_code
      end

      def fetch_access_token
        result = HTTP.get compose_url
        result['access_token']
      end

      private

      def params
        user_params = {
          grant_type: 'authorization_code',
          code: @authorization_code,
          access_token: app_access_token
        }

        URI.encode_www_form(user_params)
      end

      def compose_url
        URI(token_url + '?' + params)
      end

      def token_url
        "https://graph.accountkit.com/#{Configuration.account_kit_version}/access_token"
      end

      def app_access_token
        ['AA', Configuration.facebook_app_id, Configuration.account_kit_app_secret].join('|')
      end
    end
  end
end
