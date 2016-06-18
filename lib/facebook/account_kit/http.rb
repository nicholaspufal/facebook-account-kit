require 'net/http'
require 'json'

module Facebook
  module AccountKit
    class InvalidRequest < StandardError; end

    class HTTP
      def self.get(url)
        response = Net::HTTP.get_response url
        parsed_response = JSON.parse(response.body)
        raise InvalidRequest, parsed_response['error']['message'] if response.code != '200'

        parsed_response
      end
    end
  end
end
