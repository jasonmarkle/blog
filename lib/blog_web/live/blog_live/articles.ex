defmodule BlogWeb.BlogLive.Articles do
  use Phoenix.LiveView, layout: {BlogWeb.Layouts, :app}

  @impl Phoenix.LiveView
  def mount(
        _params,
        _session,
        socket
      ) do

        IO.inspect(socket, label: "socket")
    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def render(%{live_action: :index} = assigns) do
    ~H"""
    <p>index</p>
    """
  end
end
