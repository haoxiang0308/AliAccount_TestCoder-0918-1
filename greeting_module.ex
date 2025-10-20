defmodule GreetingModule do
  @moduledoc """
  A module that provides greeting functions.
  """

  @doc """
  Returns a greeting message.
  """
  def greet(name) do
    "Hello, #{name}! Welcome to Elixir!"
  end

  @doc """
  Returns a generic greeting.
  """
  def greet do
    "Hello! Welcome to Elixir!"
  end
end