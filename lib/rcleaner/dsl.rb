module RCleaner
  class Dsl
    attr_reader :directory
    attr_reader :steps

    def initialize
      @steps = []
    end

    def clean(directory)
      @directory = directory
    end

    private
      def move
      end

      def copy
      end

      def delete
      end
  end
end

