class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    primes_less_than(@n)
  end

  def primes_less_than(n)
    (2..n).select(&method(:prime?))
  end

  def prime?(n)
    (2...n).none? { |k| n % k == 0 }
  end
end
