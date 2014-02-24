require 'spec_helper'

describe RCleaner::Steps::DeleteStep do
  describe '#perform_step!' do
    let(:finder) { double(Object) }
    let(:deleter) { described_class.new(finder) }

    it 'should call files on the finder' do
      finder.should_receive(:files).and_return []

      deleter.perform_step!
    end

    it 'should delete the files' do
      finder.stub(:files) { %w{ a.txt b.txt } }
      FileUtils.should_receive(:rm).with('a.txt')
      FileUtils.should_receive(:rm).with('b.txt')

      deleter.perform_step!
    end
  end
end
