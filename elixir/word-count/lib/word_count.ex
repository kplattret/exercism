defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> convert_to_list
    |> count_word_occurrences
  end

  defp count_word_occurrences(list) do
    Enum.reduce(list, %{}, fn word, counts ->
      Map.update(counts, word, 1, &(&1 + 1))
    end)
  end

  defp convert_to_list(string) do
    string
    |> String.replace(~r/[:!&@$%^_,]/, " ")
    |> String.downcase
    |> String.split
  end
end
