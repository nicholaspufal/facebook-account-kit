require 'spec_helper'

module Facebook
  module AccountKit
    describe 'authentication' do
      let(:valid_auth_code) {
        "AQD8i3mnN8gNggHWdTZR_fumCrlVGCyICc10FxE4mYpu1tJFXtXIsNJDRgps9CDIEIWc2-v3cJ2K21Eov9X0wz95VElig5mheA1Uqx3U2Q96c8SmEJiqLmRfHsLhsiC95VTkU1yFctOIM9NamH73SEHUBg2InGL0ppx2cKwtLEgIgroagOevqCT-FYKsW_kww9usqZg08WmKXBaWgW-GLK7DC9ABmvmjMS1MZ0DUnzfFCR2Rcp56kKrGsk3mVH5wg2zt2L-PUNQ6YA-1s6Q573na"
      }

      context 'success' do
        it 'authenticates and retrieves the user information', vcr: { cassette_name: 'success_auth'} do
          access_token = TokenExchanger.new(valid_auth_code).fetch_access_token
          user_info = UserAccount.new(access_token).fetch_user_info

          expect(user_info).to eq('id' => '1011166682335378',
                                  'phone' => {
                                    'number' => '+15879994455',
                                    'country_prefix' => '1',
                                    'national_number' => '5879994455'
                                  })
        end
      end

      context 'failure' do
        it 'throws an exception when the authentication code is invalid', vcr: { cassette_name: 'invalid_auth_code'} do
          expect do
            TokenExchanger.new('invalid code').fetch_access_token
          end.to raise_error(InvalidRequest, 'Invalid verification code')
        end

        it 'throws an exception when the access token is invalid', vcr: { cassette_name: 'invalid_access_token'} do
          expect do
            user_info = UserAccount.new('invalid access token').fetch_user_info
          end.to raise_error(InvalidRequest, 'Invalid OAuth access token.')
        end
      end
    end
  end
end
