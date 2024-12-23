defmodule Blog.Articles do
  @moduledoc """
  Handles loading articles from markdown files
  """

  @articles_dir Path.join([:code.priv_dir(:blog), "articles"])

  def list_articles() do
    @articles_dir
    |> File.ls!()
    |> Enum.filter(&String.ends_with?(&1, ".md"))
    |> Enum.map(&Path.basename(&1, ".md"))
  end

  def get_article(name) do
    filename = Path.join(@articles_dir, "#{name}.md")

    if File.exists?(filename) do
      {:ok, content} = File.read(filename)
      {:ok, content}
    else
      {:error, "Article not found"}
    end
  end
end
