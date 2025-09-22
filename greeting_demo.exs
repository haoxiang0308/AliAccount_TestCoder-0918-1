#!/usr/bin/env elixir

defmodule GreetingDemo do
  @moduledoc """
  A simple demo module showing how to use the greeting function.
  """

  @doc """
  Returns a greeting message for the given name.
  """
  def greet(name) do
    "Hello, #{name}!"
  end

  @doc """
  Demonstrates the usage of the greet function with sample names.
  """
  def demo do
    IO.puts("Demonstrating the greeting function:")
    IO.puts(greet("World"))
    IO.puts(greet("Elixir Developer"))
    IO.puts(greet("Friend"))
  end
end

# Run the demo
GreetingDemo.demo()