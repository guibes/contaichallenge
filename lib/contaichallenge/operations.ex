defmodule Contaichallenge.Operations do

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
    |> generate_result()
    |> validate_required(@required_params)
  end

  defp generate_result(changeset) do
    first_factor = get_field(changeset, :first_factor)
    second_factor = get_field(changeset, :second_factor)
    operation = get_field(changeset, :operation)

    case operation do
    "sum"  -> put_change(changeset, :result, first_factor+second_factor)
    "sub" -> put_change(changeset, :result, first_factor-second_factor)
    "mul" -> put_change(changeset, :result, first_factor*second_factor)
    "div" -> put_change(changeset, :result, first_factor/second_factor)
    _ -> add_error(changeset, :operation, "invalid operation")
    end
  end
end
