require 'omniauth/strategies/oauth2'
require 'digest/sha2'

module OmniAuth
  module Strategies
    class Smartsheet < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "smartsheet"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site => "https://api.smartsheet.com/1.1",
        :authorize_url => "https://www.smartsheet.com/b/authorize",
        :token_url => "https://api.smartsheet.com/1.1/token"
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :first_name => raw_info['firstName'],
          :last_name => raw_info['lastName'],
          :email => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('user/me').parsed
      end

      def build_access_token
        # Smartsheet OAuth 2.0 requirements:
        # - do not pass app secret in clear text, even over SSL
        # - instead, compute SHA-256 on secret + '|' + access_code
        smartsheet_hash = Digest::SHA256.new
        smartsheet_hash.update(
          options.smartsheet_secret + '|' + request.params['code'] 
        )
        options.token_params.merge!(:hash => smartsheet_hash.hexdigest)
        super
      end
    end
  end
end
