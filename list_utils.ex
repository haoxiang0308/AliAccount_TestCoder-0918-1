defmodule ListUtils do
  @moduledoc """
  A utility module for list operations.
  """

  @doc """
  Reverses a list.
  
  ## Examples
  
      iex> ListUtils.reverse([1, 2, 3])
      [3, 2, 1]
      
      iex> ListUtils.reverse([])
      []
      
      iex> ListUtils.reverse([:a, :b, :c, :d])
      [:d, :c, :b, :a]
  """
  def reverse(list) do
    reverse_helper(list, [])
  end
  
  # Helper function that accumulates the reversed list
  defp reverse_helper([], acc), do: acc
  defp reverse_helper([head | tail], acc) do
    reverse_helper(tail, [head | acc])
  end
end