require 'spec_helper'

describe Braze::Users do
  before(:all) do
    @braze_api = Braze::Api.new(api_key: ENV['BRAZE_API_KEY'], endpoint_url: ENV['BRAZE_ENDPOINT_URL'])
  end

  describe 'Export IDs' do
    it 'returns a json response for a valid request' do
      expect(Braze::Users.export_ids(@braze_api, ENV['BRAZE_EMAIL'])).to include('message', 'users')
    end
  end

  describe 'Upsert Profile' do
    it 'returns a json response for a valid request' do
      attributes = {
        external_id: Digest::SHA256.hexdigest(ENV['BRAZE_EMAIL'].downcase),
        first_name: 'Test',
        last_name: 'Test'
      }
      expect(Braze::Users.upsert_profile(@braze_api, attributes)['message']).to eq 'success'
    end
  end
end
