defmodule GreetingProject do
  @moduledoc """
  Documentation for `GreetingProject`.
  """

  @doc """
  Returns a greeting message for the given name.

  ## Examples

      iex> GreetingProject.greet("World")
      "Hello, World!"

      iex> GreetingProject.greet("Elixir")
      "Hello, Elixir!"

  """
  def greet(name) do
    "Hello, #{name}!"
  end
end
