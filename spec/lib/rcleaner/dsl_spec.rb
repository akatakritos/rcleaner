require 'spec_helper'

describe RCleaner::Dsl do
  describe 'dsl' do
    let(:dsl) { described_class.new }

    it 'should have a copy method' do
      dsl.instance_eval do
        copy
      end
    end

    it 'should have a delete method' do
      dsl.instance_eval do
        delete
      end
    end

    it 'should have a move method' do
      dsl.instance_eval do
        delete
      end
    end
  end
end
