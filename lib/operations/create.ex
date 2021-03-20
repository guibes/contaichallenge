defmodule Contaichallenge.Operations.Create do
  alias Contaichallenge.{Repo, Operations}

  def call(params) do
    params
    |> Operations.changeset()
    |> Repo.insert()
  end
end
