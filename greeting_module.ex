defmodule GreetingModule do
  @doc "Приветствие по имени"
  def greet(name) do
    "Привет, #{name}!"
  end
end