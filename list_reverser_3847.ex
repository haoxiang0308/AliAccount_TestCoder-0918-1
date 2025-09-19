defmodule ListReverser do
  @moduledoc """
  A module containing functions to reverse lists in Elixir.
  """

  @doc """
  Reverses a list using Elixir's built-in Enum.reverse/1 function.
  
  ## Examples
  
      iex> ListReverser.reverse([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.reverse([])
      []
      
      iex> ListReverser.reverse([:a, :b, :c, :d])
      [:d, :c, :b, :a]
  """
  def reverse(list) do
    Enum.reverse(list)
  end

  @doc """
  Reverses a list using recursion.
  
  ## Examples
  
      iex> ListReverser.reverse_recursive([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.reverse_recursive([])
      []
  """
  def reverse_recursive([]), do: []
  def reverse_recursive([head | tail]) do
    reverse_recursive(tail) ++ [head]
  end
end