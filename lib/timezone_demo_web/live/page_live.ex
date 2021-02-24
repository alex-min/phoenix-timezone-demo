defmodule TimezoneDemoWeb.PageLive do
  use TimezoneDemoWeb, :live_view

  @impl true
  def mount(_params, %{"locale" => locale} = session, socket) do
    {:ok,
     assign(socket,
       locale: locale,
       timezone: socket |> get_timezone(session)
     )}
  end
end
