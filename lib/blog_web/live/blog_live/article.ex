defmodule BlogWeb.BlogLive.Article do
  use Phoenix.LiveView, layout: {BlogWeb.Layouts, :app}
  use BlogWeb, :html
  alias Blog.Articles

  def mount(%{"slug" => slug}, _session, socket) do
    case Articles.get_article(slug) do
      {:ok, content} ->
        html_content = Earmark.as_html!(content)
        {:ok, assign(socket, content: html_content, slug: slug)}

      {:error, _reason} ->
        {:ok,
          socket
          |> put_flash(:error, "Article not found")
          |> push_navigate(to: "/")}
    end
  end

  def render(assigns) do
    ~H"""
    <section class="w-full px-4 py-20 sm:px-6 lg:px-8">
      <div id="post" class="mx-auto max-w-6xl text-white">
        <%= raw @content %>
      </div>
    </section>
    """
  end
end
