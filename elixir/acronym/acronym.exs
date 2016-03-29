defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> find_acronym_letters
    |> Enum.join
    |> String.upcase
  end

  defp find_acronym_letters(word) do
    Regex.scan(~r/[A-Z]|(?<= )[a-z]/, word)
    |> Enum.map(&List.first/1)
  end
end
