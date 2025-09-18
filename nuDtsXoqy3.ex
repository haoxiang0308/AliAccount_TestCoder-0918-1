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
      
      iex> ListReverser.reverse(["a", "b", "c"])
      ["c", "b", "a"]
  """
  def reverse(list) do
    Enum.reverse(list)
  end

  @doc """
  Reverses a list using a manual recursive approach.
  
  ## Examples
  
      iex> ListReverser.reverse_manual([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.reverse_manual([])
      []
  """
  def reverse_manual(list) do
    reverse_manual(list, [])
  end

  defp reverse_manual([], acc), do: acc
  defp reverse_manual([head | tail], acc) do
    reverse_manual(tail, [head | acc])
  end
end