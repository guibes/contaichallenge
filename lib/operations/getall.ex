defmodule Contaichallenge.Operations.Getall do
  alias Contaichallenge.{Repo, Operations}
  import Ecto.Query

  @moduledoc """
  Module to get operations in the database using Repo.
  """

  @doc """
  This function can return all operations in the database, but can be limited and offsetted usign simple params.
  ```
  params = %{"limit" => 5, "offset" => 10}
  ```
  Where limit is the quantity of rows we want and offset is the number of rows we want skip.

  We can use empty params, just one or both.
  """
  def call(params) do
    case params do
      %{"limit" => limit, "offset" => offset} ->
        from(a in Operations, limit: ^limit, offset: ^offset)

      %{"limit" => limit} ->
        from(a in Operations, limit: ^limit)

      %{"offset" => offset} ->
        from(a in Operations, offset: ^offset)

      %{} ->
        from(a in Operations)
    end
    |> Repo.all()
    |> handle_response()
  rescue
    Ecto.NoResultsError -> {:error, %{message: "No operations found"}}
  end

  defp handle_response(operations), do: {:ok, operations}
end
