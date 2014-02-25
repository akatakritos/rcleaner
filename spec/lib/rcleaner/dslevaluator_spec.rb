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

  describe 'loading files' do
    let(:copyfile) { File.expand_path('spec/fixtures/rfiles/copyfile.rb') }
    let(:movefile) do
      File.join(%W{spec fixtures rfiles movefile.rb})
    end

    let(:deletefile) { File.join( %W{ spec fixtures rfiles deletefile.rb } ) }

    describe 'copy file' do
      it 'should have one copy step' do
        evaluator = described_class.new(copyfile)
        evaluator.steps.first.should be_a(RCleaner::Steps::CopyStep)
        evaluator.steps.first.pattern.should == '*.*'
        evaluator.steps.first.destination.should == '/test'
      end
    end

    describe 'move file' do
      it 'should have one move step' do
        evaluator = described_class.new(movefile)
        step = evaluator.steps.first

        step.should be_a (RCleaner::Steps::MoveStep)
        step.pattern.should == '*.*'
        step.destination.should == '/test'
      end
    end

    describe 'delete file' do
      it 'should ahve one delete step' do
        evaluator = described_class.new(deletefile)
        step = evaluator.steps.first

        step.should be_a(RCleaner::Steps::DeleteStep)
        step.pattern.should == '*.*'
      end
    end
  end
end
