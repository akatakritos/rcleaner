require 'spec_helper'

include RCleaner

describe RCleaner::Process do
  describe 'dsl' do
    let(:process) { described_class.new('.') }

    it 'should have a copy method' do
      process.instance_eval do
        copy
      end
    end

    it 'should have a delete method' do
      process.instance_eval do
        delete
      end
    end

    it 'should have a move method' do
      process.instance_eval do
        delete
      end
    end
  end
end
