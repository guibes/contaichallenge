defmodule Contaichallenge do
  @moduledoc """
  Contaichallenge keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Contaichallenge.Operations.Create, as: OperationCreate
  alias Contaichallenge.Operations.Getall, as: OperationsGetall

  defdelegate create_operation(params), to: OperationCreate, as: :call
  defdelegate get_operations(params), to: OperationsGetall, as: :call
end
