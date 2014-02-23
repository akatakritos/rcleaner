module RCleaner
  class Process
    attr_reader :directory

    def initialize(directory)
      @directory = directory
      @steps = []
    end

    def clean!
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

