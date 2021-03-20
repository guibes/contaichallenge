defmodule ContaichallengeWeb.OperationsController do

  use ContaichallengeWeb, :controller
  use PhoenixSwagger
  alias Contaichallenge.Operations

  action_fallback ContaichallengeWeb.FallbackController

   #Create
   swagger_path :create do
    post "/api/operations/{operation}/{first_factor}/{second_factor}"
    description("Create an operation in database")
    summary "In this path we can create an "
    produces "application/json"
    parameters do
      operation :path, :string, "Operations type: sum, sub, mul, div"
      first_factor :path, :integer, "First factor to operate"
      second_factor :path, :integer, "Second factor to operate"
    end
    response(:created, "Operation Created", Schema.ref(:Operation))
  end

  def swagger_definitions do
    %{
      Operation: swagger_schema do
        title "Operation"
        description "A operation in the database"
        properties do
          operation :string, "Operations type: sum, sub, mul, div"
          first_factor :integer, "First factor to operate"
          second_factor :integer, "Second factor to operate"
          result :integer, "Result of the operation"
          id :string, "ID of the operation"
        end
      end
    }
  end

  def create(conn, params) do
    with {:ok, %Operations{} = operation} <- Contaichallenge.create_operation(params) do
      conn
      |> put_status(:created)
      |> render("create.json", operation: operation)
    end
  end

  # Get All
  swagger_path :getall do
    get "/api/operations/"
    description("Create an operation in database")
    summary "List all operations in database"
    produces "application/json"
    parameters do
      limit :query, :integer, "Limit number of rows", required: false
      offset :query, :integer, "Offset the rows", required: false
    end
    response(200, "Get All Operations", Schema.ref(:Operation))
  end

  def getall(conn, params) do
    with {:ok, operations} <- Contaichallenge.get_operations(params) do
      conn
      |> put_status(200)
      |> render("get_all.json", operations: operations)
    end
   end

end
