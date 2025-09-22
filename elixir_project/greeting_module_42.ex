defmodule GreetingModule42 do
  @moduledoc """
  A simple Elixir module with a greeting function.
  """

  @doc """
  Returns a greeting message for the given name.
  
  ## Examples
  
      iex> GreetingModule42.greet("World")
      "Hello, World!"
      
      iex> GreetingModule42.greet("Alice")
      "Hello, Alice!"
  """
  def greet(name) do
    "Hello, #{name}!"
  end
end