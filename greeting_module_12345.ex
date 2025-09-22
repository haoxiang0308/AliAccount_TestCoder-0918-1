defmodule GreetingModule do
  @moduledoc """
  A simple Elixir module with a greeting function.
  """

  @doc """
  Returns a greeting message.
  
  ## Examples
  
      iex> GreetingModule.greet("World")
      "Hello, World!"
  
  """
  def greet(name) do
    "Hello, #{name}!"
  end
end