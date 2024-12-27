defmodule BlogWeb.BlogLive.Articles do
  use Phoenix.LiveView, layout: {BlogWeb.Layouts, :app}
  use BlogWeb, :html

  alias Blog.Articles

  def mount(_params, _session, socket) do
    articles = Articles.list_articles()

    {:ok, assign(socket, articles: articles)}
  end

  def render(assigns) do
    IO.inspect(assigns.articles, label: "articles value")
    ~H"""
    <section class="w-full px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-6xl">
        <h1 class="text-zinc-100">Blog</h1>
        <ul :if={@articles != []} class="w-full mx-auto max-w-4xl">
          <li :for={article <- @articles} class="w-full">
            <a class="block w-full line-height-2 text-violet-300 font-bold px-4 py-6 bg-zinc-900 hover:bg-zinc-800 focus:bg-zinc-800 border-solid border-2 border-violet-400 rounded-lg" href={~p"/blog/#{article}"}>
              <%= String.capitalize(article) %>
            </a>
          </li>
        </ul>
        <p :if={@articles == []} class="text-white">There are no artciles to read yet</p>
      </div>
    </section>
    """
  end
end
