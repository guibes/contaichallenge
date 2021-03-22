defmodule Contaichallenge.Operations.CreateTest do
  use Contaichallenge.DataCase
  alias Contaichallenge.Operations.Create
  alias Contaichallenge.{Operations, Repo}

  describe "call/1" do
    test "when all params are valid return a sum result" do
      params = %{
        first_factor: 30,
        second_factor: 30,
        operation: "sum"
      }

      {:ok, %Operations{id: operation_id}} = Create.call(params)

      operation = Repo.get(Operations, operation_id)

      assert %Operations{
              id: ^operation_id,
              first_factor: 30,
              second_factor: 30,
              operation: "sum",
              result: 60
             } = operation
    end

    test "when all params are valid return a multiplication result" do
      params = %{
        first_factor: 30,
        second_factor: 30,
        operation: "mul"
      }

      {:ok, %Operations{id: operation_id}} = Create.call(params)

      operation = Repo.get(Operations, operation_id)

      assert %Operations{
              id: ^operation_id,
              first_factor: 30,
              second_factor: 30,
              operation: "mul",
              result: 900
             } = operation
    end

    test "when all params are valid return a subtraction result" do
      params = %{
        first_factor: 30,
        second_factor: 30,
        operation: "sub"
      }

      {:ok, %Operations{id: operation_id}} = Create.call(params)

      operation = Repo.get(Operations, operation_id)

      assert %Operations{
              id: ^operation_id,
              first_factor: 30,
              second_factor: 30,
              operation: "sub",
              result: 0
             } = operation
    end

    test "when all params are valid return a division result" do
      params = %{
        first_factor: 30,
        second_factor: 30,
        operation: "div"
      }

      {:ok, %Operations{id: operation_id}} = Create.call(params)

      operation = Repo.get(Operations, operation_id)

      assert %Operations{
              id: ^operation_id,
              first_factor: 30,
              second_factor: 30,
              operation: "div",
              result: 1
             } = operation
    end

    test "when all params are invalid return an error" do
      params = %{
        first_factor: 30,
        second_factor: 30,
        operation: "add"
      }

      {:error, result} = Create.call(params)

      assert [
        result: {"can't be blank", [validation: :required]},
        operation: {"invalid operation", []}
        ] = result.errors
    end
  end
end
