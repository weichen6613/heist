require 'forwardable'

module Heist
  class Runtime
    
    class List
      include Enumerable
      attr_reader :cells
      
      extend Forwardable
      def_delegators(:@cells, :first, :last, :[], :each)
      
      def initialize(cells)
        @cells = cells
      end
      
      def eval(scope)
        Frame.new(self, scope).evaluate
      end
      
      def rest
        @cells[1..-1]
      end
      
      def to_s
        '(' + collect { |cell| cell.to_s } * ' ' + ')'
      end
      
      alias :inspect :to_s
    end
    
  end
end

