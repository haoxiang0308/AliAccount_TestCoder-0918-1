defmodule GreetingModule do
  @doc """
  Выводит приветствие в консоль.
  """
  def greet(name) do
    IO.puts("Hello, #{name}!")
  end
end