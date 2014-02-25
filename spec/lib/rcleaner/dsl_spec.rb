require 'spec_helper'

describe RCleaner::Dsl do
  describe 'dsl' do
    let(:dsl) { described_class.new }

    it 'should have a copy method' do
      dsl.instance_eval do
        copy "*.*", to: "/tmp"
      end
    end

    it 'should have a delete method' do
      dsl.instance_eval do
        delete "*.txt"
      end
    end

    it 'should have a move method' do
      dsl.instance_eval do
        move "*.rb", to: "/tmp"
      end
    end

    it 'should have a clean method' do
      dsl.instance_eval do
        clean "directory"
      end
    end

    describe 'clean' do
      it 'should set the directory' do
        dsl.instance_eval do
          clean '/tmp'
        end

        dsl.directory.should == '/tmp'
      end
    end

    describe 'move' do
      it 'should add a MoveStep to the steps list' do
        dsl.instance_eval do
          clean '/tmo' do
            move '*.*', to: '/tmp'
          end
        end

        dsl.steps.first.should be_a(RCleaner::Steps::MoveStep)
        dsl.steps.first.destination.should == '/tmp'
      end
    end

    describe 'copy' do
      it 'should add a CopyStep to the steps list' do
        dsl.instance_eval do
          clean '/tmp' do
            copy '*.*', to: '/destination'
          end
        end

        dsl.steps.first.should be_a(RCleaner::Steps::CopyStep)
        dsl.steps.first.destination.should == '/destination'
      end
    end

    describe 'delete' do
      it 'should add a DeleteStep to the steps list' do
        dsl.instance_eval do
          clean '/tmp' do
            delete '*.*'
          end
        end

        dsl.steps.first.should be_a(RCleaner::Steps::DeleteStep)
      end
    end
  end
end
