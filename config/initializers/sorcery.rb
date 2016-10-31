# The first thing you need to configure is which modules you need in your app.
# The default is nothing which will include only core features (password encryption, login/logout).
# Available submodules are: :user_activation, :http_basic_auth, :remember_me,
# :reset_password, :session_timeout, :brute_force_protection, :activity_logging, :external
Rails.application.config.sorcery.submodules = [:external]

# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|
  # -- external --
  # What providers are supported by this app, i.e. [:twitter, :facebook, :github, :linkedin, :xing, :google, :liveid, :salesforce] .
  # Default: `[]`
  config.external_providers = [:twitter]

  # Twitter will not accept any requests nor redirect uri containing localhost,
  # make sure you use 0.0.0.0:3000 to access your app in development
  config.twitter.key = ENV['TWITTER_KEY']
  config.twitter.secret = ENV['TWITTER_SECRET']
  config.twitter.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=twitter"
  config.twitter.user_info_mapping = {:email => "screen_name"}

  # --- user config ---
  config.user_config do |user|

    # -- external --
    # Class which holds the various external provider data for this user.
    # Default: `nil`
    user.authentications_class = Authentication
  end

  # This line must come after the 'user config' block.
  # Define which model authenticates with sorcery.
  config.user_class = "User"
end
