defmodule Contaichallenge.Repo.Migrations.CreateOperationsTable do
  use Ecto.Migration

  def change do
    create table :operations do
      add :first_factor, :integer
      add :second_factor, :integer
      add :operation, :string
      add :result, :integer

      timestamps()
    end
  end
end
