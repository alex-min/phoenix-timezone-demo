defmodule TimezoneDemo.Cldr do
  use Cldr,
    locales: Gettext.known_locales(TimezoneDemoWeb.Gettext),
    default_locale: "en",
    otp_app: :timezone_demo,
    providers: [Cldr.Number, Cldr.DateTime, Cldr.Calendar]
end
