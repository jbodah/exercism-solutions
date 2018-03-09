module Gigasecond
  IN_S = 1_000_000_000

  def self.from(datetime)
    datetime + IN_S
  end
end
