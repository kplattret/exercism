defmodule ProteinTranslation do
  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    codons = rna
    |> String.graphemes
    |> Enum.chunk_every(3)
    |> Enum.take(3)
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.map(&(of_codon(&1)))
    |> Enum.reject(&(elem(&1, 1) == "STOP"))

    if Enum.any?(codons, &(elem(&1, 0) == :error)) do
      {:error, "invalid RNA"}
    else
      {:ok, Enum.map(codons, &(elem(&1, 1)))}
    end
  end

  @doc """
  Given a codon, return the corresponding protein.
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    value = Map.get(@codons, codon)

    if is_nil(value), do: {:error, "invalid codon"}, else: {:ok, value}
  end
end
