defmodule Blog.RecordsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Records` context.
  """

  @doc """
  Generate a unique post title.
  """
  def unique_post_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: unique_post_title()
      })
      |> Blog.Records.create_post()

    post
  end
end
