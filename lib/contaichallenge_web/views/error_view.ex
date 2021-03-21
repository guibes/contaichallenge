defmodule ContaichallengeWeb.ErrorView do
  use ContaichallengeWeb, :view
  import Ecto.Changeset, only: [traverse_errors: 2]
  alias Ecto.Changeset

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".

  @moduledoc """
  Module to generate errors in view.
  """

  @doc """
  Function to not found.
  """
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  @doc """
  Function to work with errors in the API.
  """
  def render("400.json", %{result: %Changeset{} = changeset}) do
    %{message: translate_erros(changeset)}
  end


  #Translate erros is a function default to work with traverse_errors.

  defp translate_erros(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
