require 'httparty'
require 'json'

require_relative 'braze/api'
require_relative 'braze/email'
require_relative 'braze/users'
require_relative 'braze/models/profile'

module Braze
  ApiError = Class.new(StandardError)
end
