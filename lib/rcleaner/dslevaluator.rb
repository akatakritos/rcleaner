module RCleaner
  class DslEvaluator

    attr_reader :filename

    def initialize(filename)
      @filename = filename
      @dsl = ::RCleaner::Dsl.new
      @dsl.instance_eval file_contents
    end

    def steps
      @dsl.steps
    end

    private
      def file_contents
        File.read(filename)
      end
  end
end
