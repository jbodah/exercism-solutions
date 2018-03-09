module Complement
  MAPPING = {
    "C" => "G",
    "G" => "C",
    "A" => "U",
    "T" => "A",
  }

  def self.of_dna(dna)
    return "" unless valid?(dna)
    dna.each_char.map(&method(:of_dna_el)).join
  end

  def self.of_dna_el(dna_el)
    MAPPING[dna_el] || ""
  end

  def self.valid?(dna)
    dna.each_char.all? { |c| MAPPING[c] }
  end
end
