defmodule Contaichallenge.Operations.FindallTest do
  use Contaichallenge.DataCase
  alias Contaichallenge.Operations.{Create, Getall}
  alias Contaichallenge.{Operations}

  describe "call/1" do
    test "when exists operations, return all operations" do
      params_op1 =  %{
        first_factor: 30,
        second_factor: 30,
        operation: "div"
      }

      params_op2 =  %{
        first_factor: 30,
        second_factor: 30,
        operation: "mul"
      }

      {:ok, %Operations{id: operation_id_1}} = Create.call(params_op1)
      {:ok, %Operations{id: operation_id_2}} = Create.call(params_op2)

      query_params = %{}
      {:ok, operations} = Getall.call(query_params)

      assert [
               %Operations{
                id: ^operation_id_1,
                first_factor: 30,
                second_factor: 30,
                operation: "div",
                result: 1
               },
               %Operations{
                id: ^operation_id_2,
                first_factor: 30,
                second_factor: 30,
                operation: "mul",
                result: 900
               }
             ] = operations
    end

    test "when exists operations, return limited by 1 operation" do
      params_op1 =  %{
        first_factor: 30,
        second_factor: 30,
        operation: "div"
      }

      params_op2 =  %{
        first_factor: 30,
        second_factor: 30,
        operation: "mul"
      }

      {:ok, %Operations{id: operation_id_1}} = Create.call(params_op1)
      {:ok, %Operations{id: _operation_id_2}} = Create.call(params_op2)

      query_params = %{"limit" => 1}
      {:ok, operation} = Getall.call(query_params)

      assert [
               %Operations{
                id: ^operation_id_1,
                first_factor: 30,
                second_factor: 30,
                operation: "div",
                result: 1
               }
             ] = operation
    end

    test "when exists operations, return skip 1 row operation" do
      params_op1 =  %{
        first_factor: 30,
        second_factor: 30,
        operation: "div"
      }

      params_op2 =  %{
        first_factor: 30,
        second_factor: 30,
        operation: "mul"
      }

      {:ok, %Operations{id: _operation_id_1}} = Create.call(params_op1)
      {:ok, %Operations{id: operation_id_2}} = Create.call(params_op2)

      query_params = %{"offset" => 1}
      {:ok, operation} = Getall.call(query_params)

      assert [
                %Operations{
                  id: ^operation_id_2,
                  first_factor: 30,
                  second_factor: 30,
                  operation: "mul",
                  result: 900
                }
             ] = operation
    end

    test "when exists operations, return limit 1 and skip 1 row operation" do
      params_op1 =  %{
        first_factor: 30,
        second_factor: 30,
        operation: "div"
      }

      params_op2 =  %{
        first_factor: 30,
        second_factor: 30,
        operation: "mul"
      }

      {:ok, %Operations{id: _operation_id_1}} = Create.call(params_op1)
      {:ok, %Operations{id: operation_id_2}} = Create.call(params_op2)

      query_params = %{"limit" => 1, "offset" => 1}
      {:ok, operation} = Getall.call(query_params)

      assert [
                %Operations{
                  id: ^operation_id_2,
                  first_factor: 30,
                  second_factor: 30,
                  operation: "mul",
                  result: 900
                }
             ] = operation
    end

    test "when doesn't have operations, return 0 operations" do
      query_params = %{}
      {:ok, operations} = Getall.call(query_params)
      IO.inspect(operations)
      assert [] = operations
    end
  end
end
