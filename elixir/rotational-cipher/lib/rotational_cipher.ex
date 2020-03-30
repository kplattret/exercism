defmodule RotationalCipher do
  @lowercase ?a..?z
  @uppercase ?A..?Z

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist
    |> rotate_when_relevant(shift)
    |> to_string
  end

  defp rotate_when_relevant(charlist, shift) do
    Enum.map(charlist, fn char ->
      cond do
        char in @lowercase -> apply_rotation(@lowercase, char, shift)
        char in @uppercase -> apply_rotation(@uppercase, char, shift)
        true -> char
      end
    end)
  end

  defp apply_rotation(list, char, shift) do
    old_index = Enum.find_index(list, &(&1 == char))
    new_index = old_index + shift
    new_index = if new_index > 25, do: new_index - 26, else: new_index

    Enum.at(list, new_index)
  end
end
