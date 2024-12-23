defmodule BlogWeb.Site do
  use Phoenix.LiveView, layout: {BlogWeb.Layouts, :app}

  @impl Phoenix.LiveView
  def mount(
        _params,
        _session,
        socket
      ) do
    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def render(%{live_action: :home} = assigns) do
    ~H"""
    <section class="w-full px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-6xl">
        <h1 class="text-zinc-100 text-8xl mb-8">Welcome!</h1>
        <p class="text-zinc-100 text-xl">This website contains work and musings. It's always a work in progress.</p>
      </div>
    </section>
    """
  end
end
