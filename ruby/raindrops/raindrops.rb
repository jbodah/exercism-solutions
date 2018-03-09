module Raindrops
  class << self
    def convert(n)
      acc = ""
      acc = maybe_add_pling(acc, n)
      acc = maybe_add_plang(acc, n)
      acc = maybe_add_plong(acc, n)
      acc.size == 0 ? n.to_s : acc
    end

    {pling: 3, plang: 5, plong: 7}.each do |(sound, div)|
      class_eval <<-META
      def maybe_add_#{sound}(acc, n)
        n % #{div} == 0 ? acc << "#{sound.capitalize}" : acc
      end
      META
    end
  end
end
