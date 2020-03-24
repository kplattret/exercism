defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    dictionary = [
      {0b0001, 1, "wink"},
      {0b0010, 2, "double blink"},
      {0b0100, 4, "close your eyes"},
      {0b1000, 8, "jump"}
    ]

    results = Enum.map(dictionary, fn {bit, position, meaning} ->
      if (code &&& bit) == position, do: meaning
    end)

    handshake = Enum.reject(results, &(is_nil(&1)))

    if (code &&& 0b10000) == 16, do: Enum.reverse(handshake), else: handshake
  end
end
