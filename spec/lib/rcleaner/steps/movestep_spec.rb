require 'spec_helper'

describe RCleaner::Steps::MoveStep do
  describe 'perform_step!' do
    let(:finder) { double(Object) }
    let(:mover) { described_class.new(finder, '/') }

    it 'should call files on the finder' do
      finder.should_receive(:files).and_return []
      mover.perform_step!
    end

    it 'should move the files to the destination directory' do
      finder.stub(:files) { ['a.txt', 'b.txt'] }
      FileUtils.should_receive(:mv).with('a.txt', '/')
      FileUtils.should_receive(:mv).with('b.txt', '/')

      mover.perform_step!
    end
  end
end
