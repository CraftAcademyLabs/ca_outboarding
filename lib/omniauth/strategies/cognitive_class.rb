require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class CognitiveClass < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "cognitive_class"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options,
        site:          ENV.fetch("COGNITIVE_SITE"),
        authorize_url: ENV.fetch("COGNITIVE_AUTHORIZE_URL"),
        token_url:     ENV.fetch("COGNITIVE_TOKEN_URL")

      option :authorize_params, scope: "openid profile email"

      # https://github.com/intridea/omniauth-oauth2/issues/32
      option :provider_ignores_state, true

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.

      # Raw info: { "family_name"=>"...",
      # "sub"=>"1ea...c61",
      # "locale"=>"en",
      # "preferred_username"=>"...",
      # "given_name"=>"...", "email"=>"...",
      # "name"=>"..."}

      uid { raw_info["sub"] }

      info do
        {
          email:              raw_info["email"],
          family_name:        raw_info["family_name"],
          given_name:         raw_info["given_name"],
          locale:             raw_info["locale"],
          name:               raw_info["name"],
          preferred_username: raw_info["preferred_username"]
        }
      end

      extra do
        {
          "raw_info" => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        user_headers = { headers: { "Authorization" => "Bearer #{access_token.token}" } }
        @raw_info ||= access_token.get("/oauth2/user_info", user_headers).parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "cognitive_class", "CognitiveClass"