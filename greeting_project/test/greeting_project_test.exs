defmodule GreetingProjectTest do
  use ExUnit.Case
  doctest GreetingProject

  test "greets a person by name" do
    assert GreetingProject.greet("World") == "Hello, World!"
    assert GreetingProject.greet("Elixir") == "Hello, Elixir!"
  end
end
