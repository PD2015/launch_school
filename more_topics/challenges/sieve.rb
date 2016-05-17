class Sieve
  def initialize(input)
    @input = (2..input).to_a
  end

  def primes
 
    test_prime = @input.first
      minus_2 = @input.reject do |num|

        num % test_prime == 0 
      end

    minus_2
  end
end
