require 'spec_helper'

describe Braze::Api do
  describe 'Execute API Call' do
    it 'returns a json response for a valid request' do
      braze_api = Braze::Api.new(api_key: ENV['BRAZE_API_KEY'], endpoint_url: ENV['BRAZE_ENDPOINT_URL'])
      expect(Braze::Users.export_ids(braze_api, ENV['BRAZE_EMAIL'])['message']).to eq 'success'
    end

    it 'raises an api error on an invalid request' do
      braze_api = Braze::Api.new(api_key: 'xxxx', endpoint_url: ENV['BRAZE_ENDPOINT_URL'])
      expect { Braze::Users.export_ids(braze_api, ENV['BRAZE_EMAIL']) }.to raise_error(Braze::ApiError)
    end
  end
end
