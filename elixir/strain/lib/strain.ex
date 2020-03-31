defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    Enum.reverse(Map.get(results(list, fun), :keep))
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    Enum.reverse(Map.get(results(list, fun), :discard))
  end

  defp results(list, fun) do
    Enum.reduce(list, %{keep: [], discard: []}, fn el, map ->
      if fun.(el) do
        Map.update!(map, :keep, &([el | &1]))
      else
        Map.update!(map, :discard, &([el | &1]))
      end
    end)
  end
end
