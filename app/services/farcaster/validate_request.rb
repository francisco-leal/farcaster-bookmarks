module Farcaster
  class ValidateRequest
    def initialize(request)
      @request = request
    end

    def call
      message_bytes = params["trustedData"]["messageBytes"]

      response = Faraday.post(
        "https://api.neynar.com/v2/farcaster/frame/validate",
        {
          message_bytes_in_hex: message_bytes,
          cast_reaction_context: true, # can be turned to a param
          follow_context: true # can be turned to a param
        }.to_json,
        {
          "Content-Type" => "application/json",
          "api_key" => neynar_api_key
        }
      )

      if response.status == 200
        JSON.parse(response.body, symbolize_names: true)
      end
    end

    private

    def neynar_api_key
      @neynar_api_key ||= ENV["NEYNAR_API_KEY"]
    end
  end
end