require_relative './http'
require 'openssl'

module Facebook
  module AccountKit
    class UserAccount
      def initialize(access_token)
        @access_token = access_token
      end

      def fetch_user_info
        HashWithIndifferentAccess.new(HTTP.get(compose_url))
      end

      private

      def params
        token_params = {
          access_token: @access_token,
          appsecret_proof: secret_proof
        }

        URI.encode_www_form(token_params)
      end

      def secret_proof
        digest = OpenSSL::Digest.new('sha256')
        OpenSSL::HMAC.hexdigest(digest, Configuration.account_kit_app_secret, @access_token)
      end

      def compose_url
        URI(me_url + '?' + params)
      end

      def me_url
        "https://graph.accountkit.com/#{Configuration.account_kit_version}/me"
      end
    end
  end
end
