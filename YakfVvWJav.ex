defmodule Greeting do
  @moduledoc """
  A simple module with a greeting function.
  """

  @doc """
  Returns a greeting message for the given name.
  
  ## Examples
  
      iex> Greeting.hello("World")
      "Hello, World!"
      
      iex> Greeting.hello("Elixir")
      "Hello, Elixir!"
  """
  def hello(name) do
    "Hello, #{name}!"
  end
  
  @doc """
  Returns a general greeting message.
  
  ## Examples
  
      iex> Greeting.general()
      "Hello there! Welcome to Elixir programming."
  """
  def general do
    "Hello there! Welcome to Elixir programming."
  end
end