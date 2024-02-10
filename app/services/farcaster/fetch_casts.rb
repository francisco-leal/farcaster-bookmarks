require "faraday"

module Farcaster
  class FetchCasts
    def initialize
    end

    def call
      response = Faraday.get(
        "https://api.warpcast.com/v2/recent-casts?limit=1000",
        {},
        merkle_headers
      )
    end

    private
    
    def merkle_headers
      {
        "Authorization" => "Bearer #{ENV['MERKLE_SECRET']}",
        "Content-Type" => "application/json"
      }
    end
  end
end
