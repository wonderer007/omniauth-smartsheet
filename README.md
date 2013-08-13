# OmniAuth Smartsheet Strategy

This gem provides a simple way to authenticate to Smartsheet using OmniAuth with OAuth2.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-smartsheet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-smartsheet

## Usage

Create `config/initializers/omniauth.rb`:

	Rails.application.config.middleware.use OmniAuth::Builder do
    	provider :smartsheet, 'APP_CLIENT_ID', nil, :smartsheet_secret => 'APP_SECRET', :scope => 'READ_SHEETS'
  	end
  	
You may need to customize the scope for your app.  See the [Smartsheet API 
documentation](http://smartsheet.com/developers) for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/7930547437b683706b9cccc465807b52 "githalytics.com")](http://githalytics.com/smartsheet-platform/omniauth-smartsheet)
