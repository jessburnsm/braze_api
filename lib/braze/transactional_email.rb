module Braze
  class TransactionalEmail
    def self.send_mail(api, options = {})
      api.execute('/messages/send', options)
    end
  end
end
