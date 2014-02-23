require 'spec_helper'

describe RCleaner::Steps::CopyStep do
  describe 'perform_step!' do
    let(:finder) { double(Object) }
    let(:copy_step) { described_class.new(finder, '/') }

    it 'calls out to files on the finder' do
      finder.should_receive(:files).and_return []
      copy_step.perform_step!
    end

    it 'deletes the return files' do
      finder.stub(:files) { ['a.txt', 'b.txt'] }
      FileUtils.should_receive(:cp).with('a.txt', '/')
      FileUtils.should_receive(:cp).with('b.txt', '/')
      copy_step.perform_step!
    end
  end
end

