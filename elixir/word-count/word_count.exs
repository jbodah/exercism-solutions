defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> extract_words
    |> downcase
    |> Enum.reduce(%{}, &update_count/2)
  end

  defp downcase(list) do
    list |> Enum.map(&String.downcase/1)
  end

  defp extract_words(sentence) do
    Regex.scan(~r/(*UTF)[\p{L}0-9-]+/i, sentence)
    |> Enum.map(&List.first/1)
  end

  defp update_count(word, map) do
    Map.update map, word, 1, &(&1 + 1)
  end
end
