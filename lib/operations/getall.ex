defmodule Contaichallenge.Operations.Getall do
  alias Contaichallenge.{Repo, Operations}
  import Ecto.Query

  def call(params) do
    case params do
      %{"limit" => limit, "offset" => offset}  -> from(a in Operations, limit: ^limit, offset: ^offset)
      %{"limit" => limit} -> from(a in Operations, limit: ^limit)
      %{"offset" => offset} -> from(a in Operations, offset: ^offset)
      %{} -> from(a in Operations)
    end
    |> Repo.all()
    |> handle_response()
    rescue
      Ecto.NoResultsError -> {:error, %{message: "No operations found"} }
  end

  defp handle_response(operations), do: {:ok, operations}
end
