require 'spec_helper'

describe Braze::Users do
  describe 'Export IDs' do
    it 'returns a json response for a valid request' do
      braze_api = Braze::Api.new(api_key: ENV['BRAZE_API_KEY'], endpoint_url: ENV['BRAZE_ENDPOINT_URL'])
      expect(Braze::Users.export_ids(braze_api, ENV['BRAZE_EMAIL'])).to include('message', 'users')
    end
  end
end
