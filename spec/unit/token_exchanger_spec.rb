module Facebook
  module AccountKit
    describe TokenExchanger do
      let(:subject) { described_class.new '12345' }

      context 'success' do
        it 'exchanges a token' do
          expected_uri = URI('https://graph.accountkit.com/v1.0/access_token?grant_type=authorization_code&code=12345&access_token=AA%7Crandom_id%7Crandom_secret')
          fake_body = { 'access_token' => '12345' }
          mocked_response = double('fake response',
                                   body: JSON.dump(fake_body),
                                   code: '200')

          expect(Net::HTTP).to receive(:get_response).with(expected_uri)
            .and_return(mocked_response)

          expect(subject.fetch_access_token).to eq '12345'
        end
      end

      context 'error' do
        it 'throws an InvalidRequest exception if status is not success' do
          error_message = { 'message' => 'This is pretty serious' }
          mocked_response = double('fake response',
                                   body: JSON.dump('error' => error_message),
                                   code: '500')

          expect(Net::HTTP).to receive(:get_response).and_return(mocked_response)

          expect do
            subject.fetch_access_token
          end.to raise_error(InvalidRequest, 'This is pretty serious')
        end
      end
    end
  end
end
