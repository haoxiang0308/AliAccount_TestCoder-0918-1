defmodule ListReverser do
  @moduledoc """
  A module containing functions to reverse lists in Elixir.
  """

  @doc """
  Reverses a list using Elixir's built-in function.
  
  ## Examples
  
      iex> ListReverser.reverse([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.reverse([])
      []
      
      iex> ListReverser.reverse(["a", "b", "c"])
      ["c", "b", "a"]
  """
  def reverse(list) do
    Enum.reverse(list)
  end

  @doc """
  Reverses a list using a recursive approach.
  
  ## Examples
  
      iex> ListReverser.reverse_recursive([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.reverse_recursive([])
      []
      
      iex> ListReverser.reverse_recursive(["a", "b", "c"])
      ["c", "b", "a"]
  """
  def reverse_recursive([]), do: []
  def reverse_recursive([head | tail]) do
    reverse_recursive(tail) ++ [head]
  end
end