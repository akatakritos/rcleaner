require 'spec_helper'

describe RCleaner::DslEvaluator do
  describe '#initialize' do
    before do
      File.stub(:read) { "" }
    end

    it 'takes the file as a param' do
      evaluator = described_class.new('s')
      evaluator.filename.should == 's'
    end
  end
end
