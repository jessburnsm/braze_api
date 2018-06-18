require 'spec_helper'

describe Braze::Profile do
  before(:all) do
    @braze_profile = Braze::Profile.new(ENV['BRAZE_EMAIL'])
  end

  describe 'Name Assignment' do
    it 'does not allow modification of first name once set' do
      @braze_profile.first_name = 'Test'
      @braze_profile.first_name = 'Test2'
      expect(@braze_profile.first_name).to eq 'Test'
    end

    it 'does not allow modification of last name once set' do
      @braze_profile.last_name = 'Test'
      @braze_profile.last_name = 'Test2'
      expect(@braze_profile.last_name).to eq 'Test'
    end
  end

  describe 'Attribute Assignment' do
    it 'only returns attributes that have been set or are required by the api' do
      braze = Braze::Profile.new(ENV['BRAZE_EMAIL'])
      braze.first_name = 'Test'

      expect(braze.attributes).to include(:email, :first_name, :updated,
                                          :newsletter_updated, :external_id, :email_hash,
                                          :created, :system_of_origin, :email_subscribe)
    end
  end
end
