require 'spec_helper'

describe RCleaner::Application do
  describe 'sample01 - one of each' do
    let(:cwd) { File.join %W{ spec fixtures sample01 } }
    let(:rfile) do
      File.expand_path(File.join(%W{ spec fixtures sample01.rfile }))
    end
    it 'should perform all the actions in the rfile' do
      file = rfile #need to calculate this before we cwd
      cd cwd do
        FileUtils.should_receive(:rm).with(File.expand_path('deleteme.cpp'))
        FileUtils.should_receive(:cp).with(File.expand_path('copyme.txt'), '/tmp')
        FileUtils.should_receive(:mv).with(File.expand_path('moveme.docx'), '/tmp')
        app = described_class.new(file, cwd)
        app.run!
      end
    end
  end
end
