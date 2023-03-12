defmodule BlogWeb.PageController do
  use BlogWeb, :controller

  def index(conn, _params) do
    # render(conn, :index, layout: false)
    render(conn, :index)
  end
end
