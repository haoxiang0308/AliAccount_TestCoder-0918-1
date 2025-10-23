defmodule HelloWorldElixir do
  @doc """
  A simple greeting function that returns a greeting message.
  """
  def greet(name) do
    "Hello, #{name}! Welcome to Elixir!"
  end

  @doc """
  A default greeting function that returns a general greeting message.
  """
  def greet do
    "Hello! Welcome to Elixir!"
  end
end