defmodule SecretHandshake do
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
  def commands(0), do: []
  def commands(1), do: ["wink"]
  def commands(2), do: ["double blink"]
  def commands(4), do: ["close your eyes"]
  def commands(8), do: ["jump"]
  def commands(16), do: []
  def commands(n) do
    cond do
      n > 16 -> Enum.reverse(commands(n - 16))
      n > 8 -> commands(n - 8) ++ commands(8)
      n > 4 -> commands(n - 4) ++ commands(4)
      n > 2 -> commands(n - 2) ++ commands(2)
    end
  end
end
