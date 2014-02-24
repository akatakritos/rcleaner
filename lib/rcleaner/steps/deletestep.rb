module RCleaner::Steps
  class DeleteStep
    def initialize(finder)
      @finder = finder
    end

    def perform_step!
      @finder.files.each do |f|
        FileUtils.rm(f)
      end
    end
  end
end
