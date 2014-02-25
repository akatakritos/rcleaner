module RCleaner::Steps
  class CopyStep

    attr_reader :destination
    def initialize(finder, destination)
      @finder = finder
      @destination = destination
    end

    def pattern
      @finder.pattern
    end

    def perform_step!
      @finder.files.each do |f|
        FileUtils.cp(f, @destination)
      end
    end
  end
end

