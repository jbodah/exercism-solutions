defmodule Teenager do
  @moduledoc """
  Bob is a lackadaisical teenager

  Bob answers 'Sure.' if you ask him a question.

  He answers 'Woah, chill out!' if you yell at him.

  He says 'Fine. Be that way!' if you address him without actually saying anything.

  He answers 'Whatever.' to anything else.
  """

  def hey(string) do
    cond do
      silence?(string)  -> "Fine. Be that way!"
      yelling?(string)  -> "Woah, chill out!"
      question?(string) -> "Sure."
      true              -> "Whatever."
    end
  end

  defp yelling?(string) do
    String.upcase(string) == string && String.match?(string, ~r/[\p{L}a-zA-Z]+/)
  end

  defp question?(string) do
    string |> String.last == "?"
  end

  defp silence?(string) do
    string |> String.match?(~r/^\s*$/)
  end
end
