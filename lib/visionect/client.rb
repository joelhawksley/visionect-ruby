require "visionect/client/backend"

module Visionect
  class Client
    include Visionect::Client::Backend

    attr_reader :host, :port, :api_key, :api_secret

    def initialize(
      host: ENV["VISIONECT_HOST"],
      port: ENV["VISIONECT_PORT"] || "8081",
      api_key: ENV["VISIONECT_API_KEY"],
      api_secret: ENV["VISIONECT_API_SECRET"]
    )
      @host = host
      @port = port
      @api_key = api_key
      @api_secret = api_secret
    end
  end
end
