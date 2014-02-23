module RCleaner
  class FileFinder

    attr_reader :directory, :pattern

    def initialize(directory, pattern)
      @directory = directory
      @pattern = pattern
    end

    def files
      Dir.glob(glob_pattern)
    end

    private
      def glob_pattern
        File.join(@directory, @pattern)
      end
  end
end

