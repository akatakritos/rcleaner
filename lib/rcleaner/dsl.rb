module RCleaner
  class Dsl
    attr_reader :directory
    attr_reader :steps

    def initialize
      @steps = []
    end

    def clean(directory)
      @directory = directory == :cwd ? Dir.getwd : directory
      yield if block_given?
    end

    private
      def move(pattern, args={})
        destination = args.fetch(:to, '/tmp')
        finder = FileFinder.new(@directory, pattern)
        @steps.push RCleaner::Steps::MoveStep.new(finder, destination)
      end

      def copy(pattern, args={})
        destination = args.fetch(:to, '/tmp')
        finder = FileFinder.new(@directory, pattern)
        @steps.push RCleaner::Steps::CopyStep.new(finder, destination)
      end

      def delete(pattern)
        finder = FileFinder.new(@directory, pattern)
        @steps.push RCleaner::Steps::DeleteStep.new(finder)
      end
  end
end

