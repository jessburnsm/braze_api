module Braze
  class Users
    # POST https://YOUR_REST_API_URL/users/export/ids
    # https://www.braze.com/documentation/REST_API/#users-by-identifier-endpoint
    def self.export_ids(api, email_address)
      api.execute('/users/export/ids', email_address: email_address)
    end

    # POST https://YOUR_REST_API_URL/users/track
    # https://www.braze.com/documentation/REST_API/#user-track-request
    def self.upsert_profile(api, attributes)
      api.execute('/users/track', attributes: [attributes])
    end
  end
end
