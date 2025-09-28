defmodule GreetingModule do
  @doc "Outputs a simple greeting message."
  def greet(name) do
    IO.puts("Hello, #{name}!")
  end
end