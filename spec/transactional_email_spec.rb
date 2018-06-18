require 'spec_helper'

describe Braze::TransactionalEmail do
  before(:all) do
    @braze_api = Braze::Api.new(api_key: ENV['BRAZE_API_KEY'], endpoint_url: ENV['BRAZE_ENDPOINT_URL'])
    @profile = Braze::Users.fetch_profiles(@braze_api, ENV['BRAZE_EMAIL']).first

    @email_obj = {
      external_user_ids: [@profile.external_id],
      messages: {
        email: {
          app_id: ENV['BRAZE_APP_ID'],
          subject: 'Test Email',
          from: "Test Tester <#{ENV['BRAZE_EMAIL']}>",
          body: '<html><body>Hello World</body></html>'
        }
      }
    }
  end

  describe 'Send Mail' do
    it 'returns a json response for a valid request' do
      expect(Braze::TransactionalEmail.send_mail(@braze_api, @email_obj)).to include('message')
    end
  end
end
