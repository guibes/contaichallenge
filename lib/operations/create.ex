defmodule Contaichallenge.Operations.Create do
  alias Contaichallenge.{Repo, Operations}

  @moduledoc """
  Module to insert the params into database using Repo.
  """

  @doc """
  Function to insert generate changeset from params and put into database.
  """
  def call(params) do
    params
    |> Operations.changeset()
    |> Repo.insert()
  end
end
