module Hamming
  def self.compute(a, b)
    a.each_char.zip(b.each_char).reduce(0) do |acc, (a, b)|
      break acc unless a && b
      a == b ? acc : acc + 1
    end
  end
end
