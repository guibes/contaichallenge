defmodule ContaichallengeWeb.OperationsView do

  use ContaichallengeWeb, :view
  alias Contaichallenge.Operations
  alias ContaichallengeWeb.OperationsView



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

def render("get_all.json", %{operations: operations}), do: %{operations: render_many(operations, OperationsView, "get.json"), operationsCount: length(operations), message: "Operations listed"}

end
