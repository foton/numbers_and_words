module NumbersAndWords
  module Strategies
    module FiguresConverter
      module Languages
        class Lt < Base
          include Families::Latin

          private

          def capacity_iteration
            words = []
            capacity_words = words_in_capacity(@current_capacity)
            words.push(megs) unless capacity_words.empty?
            words += capacity_words unless thousand? && one?
            words
          end

          def one?
            words_in_capacity(@current_capacity) == [translations.ones(1)]
          end

          def thousand?
            FiguresArray::THOUSAND_CAPACITY == @current_capacity
          end

          def hundreds
            super({ is_hundred: (figures[1, 2] == [0, 1] && simple_number_to_words.empty?) })
          end

          def megs
            super({ number: @figures.number_in_capacity(@current_capacity) })
          end
        end
      end
    end
  end
end
