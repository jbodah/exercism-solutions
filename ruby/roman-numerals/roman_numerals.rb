module RomanNumerals
  ROMAN = {
    0 => {single: 'I', fifth: 'V', tenth: 'X'},
    1 => {single: 'X', fifth: 'L', tenth: 'C'},
    2 => {single: 'C', fifth: 'D', tenth: 'M'},
    3 => {single: 'M'}
  }

  def to_roman
    n = self
    digits = "#{n}".each_char
    size = digits.size
    digits.each.with_index.reduce("") do |acc, (n, idx)|
      roman = romanify(n.to_i, size - idx - 1)
      roman ? acc << roman : acc
    end
  end

  private

  def romanify(digit, power)
    return nil if digit == 0
    build =
      case
      when digit < 4 then digit.times.map { :single }
      when digit == 4 then [:single, :fifth]
      when digit == 5 then [:fifth]
      when digit < 9 then [:fifth] + (digit - 5).times.map { :single }
      when digit == 9 then [:single, :tenth]
      end
    build.map { |b| ROMAN[power][b] }.join
  end
end

Integer.include(RomanNumerals)
