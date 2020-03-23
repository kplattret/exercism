defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    mapping = %{"G": "C", "C": "G", "T": "A", "A": "U"}
    string = to_string(dna)
    letters_in = String.upcase(string) |> String.graphemes
    letters_out = Enum.map(letters_in, fn letter -> mapping[String.to_atom(letter)] end)

    to_charlist(Enum.join(letters_out))
  end
end
