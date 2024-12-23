defmodule BlogWeb.BlogLive.Articles do
  use Phoenix.LiveView, layout: {BlogWeb.Layouts, :app}
  use BlogWeb, :html
  alias Blog.Articles
  import Phoenix.HTML

  def mount(_params, _session, socket) do
    articles = Articles.list_articles()
    {:ok, assign(socket, articles: articles)}
  end

  def render(assigns) do
    ~H"""
    <section class="w-full px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-6xl">
        <h1 class="text-zinc-100 text-8xl mb-8">Articles</h1>
        <ul class="w-full mx-auto max-w-4xl">
          <li :for={article <- @articles} class="w-full">
            <a class="block w-full text-2xl line-height-2 text-violet-300 font-bold px-4 py-6 bg-zinc-900 hover:bg-zinc-800 focus:bg-zinc-800 border-solid border-2 border-violet-400 rounded-lg" href={~p"/blog/#{article}"}>
              <%= String.capitalize(article) %>
            </a>
          </li>
        </ul>
      </div>
    </section>
    """
  end
end
