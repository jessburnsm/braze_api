require 'httparty'
require 'json'

require_relative 'braze/api'
require_relative 'braze/users'

module Braze
  ApiError = Class.new(StandardError)
end
