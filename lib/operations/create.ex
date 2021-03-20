defmodule ChallengeContai.Operations.Create do
  alias ChallengeContai.{Repo, Operations}

  def call(params) do
    params
    |> Operations.changeset()
    |> Repo.insert()
  end
end
