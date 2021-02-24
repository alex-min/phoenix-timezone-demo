defmodule TimezoneDemo.Repo do
  use Ecto.Repo,
    otp_app: :timezone_demo,
    adapter: Ecto.Adapters.Postgres
end
