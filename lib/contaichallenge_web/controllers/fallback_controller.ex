defmodule ContaichallengeWeb.FallbackController do
  use ContaichallengeWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ContaichallengeWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
