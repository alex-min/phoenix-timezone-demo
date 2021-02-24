defmodule TimezoneDemoWeb.LiveHelpers do
  def get_timezone(socket, session) do
    if Phoenix.LiveView.connected?(socket) do
      case Phoenix.LiveView.get_connect_params(socket) do
        %{"timezone" => timezone} -> timezone
        _ -> session["timezone"] || 0
      end
    else
      session["timezone"] || 0
    end
  end

  def to_datestring(date, _locale, _timezone) when date == nil or date == "" do
    ""
  end

  def to_datestring(date, locale, timezone) when is_binary(date) do
    {:ok, parsed_date, _} = DateTime.from_iso8601(date)

    {:ok, str} =
      TimezoneDemo.Cldr.DateTime.to_string(parsed_date |> Timex.shift(hours: timezone),
        locale: locale
      )

    str
  end

  @spec to_datestring(DateTime.t() | String.t(), String.t(), integer()) :: String.t()
  def to_datestring(date, locale, timezone) do
    {:ok, str} =
      TimezoneDemo.Cldr.DateTime.to_string(date |> Timex.shift(hours: timezone), locale: locale)

    str
  end
end
