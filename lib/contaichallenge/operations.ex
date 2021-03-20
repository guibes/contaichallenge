defmodule ContaiChallenge.Operations do

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:first_factor, :second_factor, :operation, :result]

  schema "operations" do
    field :first_factor, :integer
    field :second_factor, :integer
    field :operation, :string
    field :result, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(params, @required_params)
  end
end
