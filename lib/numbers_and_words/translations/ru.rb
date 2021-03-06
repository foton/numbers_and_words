module NumbersAndWords
  module Translations
    class Ru < Base
      include NumbersAndWords::Translations::Families::Cyrillic
      include NumbersAndWords::Translations::Extensions::FractionSignificance

      def micros(capacity, number = nil, separator = ' ')
        micro, prefix = capacity
        micros = t(:micro, count: number)[micro]
        [micro_prefix(prefix), micros].compact.join separator
      end

      def micro_prefix(capacity)
        case capacity
        when 2 then t(:sub_micro)[2]
        when 1 then t(:sub_micro)[1]
        end
      end

      # def fraction_separator options = {}
      #  super if options[:with_fractional_separator]
      # end
    end
  end
end
