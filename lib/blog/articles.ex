defmodule Blog.Articles do
  @moduledoc """
  Handles loading articles from markdown files
  """

  def list_articles do
    articles_dir =
      if Mix.env() == :prod do
        Path.join([:code.priv_dir(:blog), "../blog-0.1.0", "articles"])
      else
        Path.join([:code.priv_dir(:blog), "articles"])
      end
    IO.inspect(:code.priv_dir(:blog), label: "Articles Directory")  # Inspect the path

    articles_dir
    |> File.ls!()
    |> Enum.filter(&String.ends_with?(&1, ".md"))
    |> Enum.map(&Path.basename(&1, ".md"))
  end

  def get_article(name) do
    articles_dir =
      if Mix.env() == :prod do
        Path.join([:code.priv_dir(:blog), "../blog-0.1.0", "articles"])
      else
        Path.join([:code.priv_dir(:blog), "articles"])
      end

    filename = Path.join(articles_dir, "#{name}.md")

    if File.exists?(filename) do
      {:ok, content} = File.read(filename)
      {:ok, content}
    else
      {:error, "Article not found"}
    end
  end
end
