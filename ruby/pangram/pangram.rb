require 'set'

module Pangram
  class << self
    def pangram?(str)
      return false if str.size == 0
      contains_every_letter?(str)
    end

    def contains_every_letter?(str)
      set = Set.new
      ('a'..'z').each(&set.method(:<<))
      str.each_char do |c|
        set.delete(c.downcase)
        return true if set.size == 0
      end
      set.size == 0
    end
  end
end
