module RCleaner::Steps
  class CopyStep

    def initialize(finder, destination)
      @finder = finder
      @destination = destination
    end

    def perform_step!
      @finder.files.each do |f|
        FileUtils.cp(f, @destination)
      end
    end
  end
end

