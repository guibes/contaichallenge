defmodule ContaichallengeWeb.OperationsView do

  use ContaichallengeWeb, :view
  alias Contaichallenge.Operations
  alias ContaichallengeWeb.OperationsView

  @moduledoc """
  Module to generate the views of the Operations in the API.
  """

  @doc """
  Function to render the create response.
  """

  def render("create.json", %{
    operation: %Operations{
      id: id,
      operation: operation,
      first_factor: first_factor,
      second_factor: second_factor,
      result: result
    }
  }) do
%{
  message: "Operation created",
  operation: %{
      id: id,
      operation: operation,
      first_factor: first_factor,
      second_factor: second_factor,
      result: result
    }
  }

end

@doc """
  Function to render the get one response.
  """

def render("get.json",
%{
  operations: %Operations{
    id: id,
    operation: operation,
    first_factor: first_factor,
    second_factor: second_factor,
    result: result
  }
}
) do
%{
operation: %{
    id: id,
    operation: operation,
    first_factor: first_factor,
    second_factor: second_factor,
    result: result
  }
}

end
@doc """
  Function to render the get all response.
  """
def render("get_all.json", %{operations: operations}), do: %{operations: render_many(operations, OperationsView, "get.json"), operationsCount: length(operations), message: "Operations listed"}

end
