module Braze
  class Api
    attr_reader :api_key, :endpoint_url

    def initialize(api_key:, endpoint_url:)
      @api_key = api_key
      @endpoint_url = endpoint_url
    end

    def execute(route, options = {})
      process_api_response(
        JSON.parse(
          HTTParty.post(
            @endpoint_url + route,
            query: { api_key: @api_key }.merge(options)
          ).to_s
        )
      )
    end

    private

    def process_api_response(response)
      raise ApiError, "The request could not be processed by the API (#{response['message']})." if response['message'] != 'success'
      response
    end
  end
end
