defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(str) do
    { head, rest } = remove_first(str)
    _encode("", head, 1, rest)
  end

  def _encode(encoded, current, count, "") do
    stringify [encoded, count, current]
  end

  def _encode(encoded, current, count, str) do
    { head, rest } = remove_first(str)
    cond do
      head == current ->
        _encode(encoded, current, count + 1, rest)
      true ->
        new_encoded = stringify [encoded, count, current]
        _encode(new_encoded, head, 1, rest)
    end
  end

  defp remove_first(str) do
    str |> String.split_at(1)
  end

  defp stringify(args) do
    Enum.join(args)
  end

  @spec decode(String.t) :: String.t
  def decode(str) do
    Regex.scan(~r/(\d+)([A-z])/, str)
    |> Enum.map_join(fn [_, num, char] ->
        String.duplicate(char, String.to_integer(num))
      end)
  end
end
