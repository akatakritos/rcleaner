module RCleaner
  class Application

    def initialize(rfile, cwd)
      @rfile = rfile
      @directory = cwd
    end

    def run!
      evaluator = RCleaner::DslEvaluator.new(@rfile)
      evaluator.steps.each do |step|
        step.perform_step!
      end
    end
  end
end
