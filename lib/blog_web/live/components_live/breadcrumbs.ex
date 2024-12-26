defmodule BlogWeb.ComponentsLive.Breadcrumbs do
  use Phoenix.LiveComponent

  defstruct [:breadcrumbs]

  def update(assigns, socket) do
    socket = assign(socket, assigns)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div aria-label="breadcrumbs">
      <ol class="flex flex-row gap-x-2 mb-2">
          <li :for={breadcrumb <- @breadcrumbs} class="block bg-violet-400 px-2 text-black">
            <a href={breadcrumb[:url]}><%= breadcrumb[:name] %></a>
          </li>
      </ol>
    </div>
    """
  end
end
