require 'spec_helper'

describe Braze::Email do
  before(:all) do
    @braze_api = Braze::Api.new(api_key: ENV['BRAZE_API_KEY'], endpoint_url: ENV['BRAZE_ENDPOINT_URL'])
  end

  describe 'Set Status' do
    it 'returns a json response for a valid request' do
      expect(Braze::Email.set_status(@braze_api, ENV['BRAZE_EMAIL'], 'subscribed')).to include('message')
    end
  end
end
