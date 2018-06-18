module Braze
  class Email
    # POST https://YOUR_REST_API_URL/email/status
    # https://www.braze.com/documentation/REST_API/#changing-email-subscription-status
    def self.set_status(api, email_address, status)
      api.execute('/email/status', email: email_address, subscription_state: status)
    end
  end
end
