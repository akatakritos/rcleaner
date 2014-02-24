module RCleaner::Steps
  class MoveStep

    def initialize(finder, destination)
      @finder = finder
      @destination = destination
    end

    def perform_step!
      @finder.files.each do |f|
        FileUtils.mv(f, @destination)
      end
    end
  end
end
