module Braze
  class Users
    # POST https://YOUR_REST_API_URL/users/export/ids
    # https://www.braze.com/documentation/REST_API/#users-by-identifier-endpoint
    def self.export_ids(api, email_address)
      api.execute('/users/export/ids', email_address: email_address)
    end
  end
end
