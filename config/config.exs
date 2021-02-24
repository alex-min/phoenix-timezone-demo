# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :timezone_demo,
  ecto_repos: [TimezoneDemo.Repo]

# Configures the endpoint
config :timezone_demo, TimezoneDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QhJuMbwOFUtxNtwS4/A2B/e0tkEIcOxFqXPCJRqY930oD2JRbhPuNrHTTJVAMa0i",
  render_errors: [view: TimezoneDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TimezoneDemo.PubSub,
  live_view: [signing_salt: "7wReKvfC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :timezone_demo, MavioWeb.Gettext, default_locale: "en"

config :timezone_demo, TimezoneDemo.Cldr,
  default_locale: "en",
  locales: ["fr", "en"],
  gettext: TimezoneDemoWeb.Gettext,
  data_dir: "./priv/cldr"

config :date_time_parser, parsers: [Parser.Epoch, Parser.Serial, Parser.Tokenizer, Parser.Epoch]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
