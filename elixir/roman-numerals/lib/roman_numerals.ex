defmodule RomanNumerals do
  @mapping %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  @values Map.keys(@mapping) |> Enum.sort(:desc)

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    extract_values(number, [], @values) |> Enum.map_join(&(@mapping[&1]))
  end

  defp extract_values(_input, output, []), do: Enum.reverse(output)
  defp extract_values(input, output, values) do
    difference = input - hd(values)

    cond do
      difference < 0 -> extract_values(input, output, tl(values))
      difference > 0 -> extract_values(difference, [hd(values) | output], values)
      true -> extract_values(difference, [hd(values) | output], [])
    end
  end
end
