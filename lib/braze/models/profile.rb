module Braze
  class Profile
    require 'digest'
    require 'time'

    attr_reader :email, :external_id, :email_hash, :first_name, :last_name
    attr_accessor :created, :device_signup, :email_subscribe, :newsletter_signup,
                  :marketing_site_updated, :ps4_notification, :student_sub_form,
                  :subscription_status, :system_of_origin, :updated,
                  :university_name, :xbox_notification

    def initialize(email_address, external_id = nil, first_name = nil, last_name = nil)
      @email = email_address
      @updated = Time.now.iso8601
      @marketing_site_updated = Time.now.iso8601
      @first_name = first_name unless first_name.to_s.empty?
      @last_name = last_name unless last_name.to_s.empty?

      if external_id
        @external_id = external_id
      else
        establish_new_profile
      end
    end

    # Create a list of attributes we need to send to braze for processing
    def attributes
      instance_variables.reject { |var| instance_variable_get(var).to_s.empty? }.map { |var| [var.to_s.delete('@').to_sym, instance_variable_get(var)] }.to_h
    end

    # Do not set first name if if was already set in the initializer
    def first_name=(value)
      @first_name = value if @first_name.to_s.empty?
    end

    # Do not set last name if if was already set in the initializer
    def last_name=(value)
      @last_name = value if @last_name.to_s.empty?
    end

    private

    def establish_new_profile
      @external_id = Digest::SHA256.hexdigest(@email.downcase)
      @email_hash = @external_id
      @created = Time.now.iso8601
      @system_of_origin = 'Marketing Site'
      @email_subscribe = 'subscribed'
    end
  end
end
