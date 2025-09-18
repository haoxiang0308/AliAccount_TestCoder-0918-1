defmodule ListReverser do
  @doc """
  Reverses a list.
  
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