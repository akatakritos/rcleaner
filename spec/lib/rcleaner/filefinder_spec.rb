require 'spec_helper'

describe RCleaner::FileFinder do
  describe '#initialize' do
    it 'takes a directory and a pattern' do
      finder = described_class.new('/', '*.*')
      finder.directory.should == '/'
      finder.pattern.should == '*.*'
    end
  end

  describe '#files' do
    it 'should shell out to Dir.glob' do
      Dir.should_receive(:glob).with('/*')
      described_class.new('/', '*').files
    end
  end

end
