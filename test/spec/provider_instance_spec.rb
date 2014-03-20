# minitest spec for ChefInstance::Resource::Instance
# Uses expectations from:
# http://docs.seattlerb.org/minitest/Minitest/Expectations.html

require_relative 'spec_helper'
require 'chef_instance/resource_instance'
require 'chef_instance/provider_instance'

describe 'ResourceInstance', 'Tests for ChefInstance::Resource::Instance' do
  let(:node) do
    node = Chef::Node.new
    node.automatic['platform'] = 'ubuntu'
    node.automatic['platform_version'] = '12.04'
    node
  end

  let(:events) { Chef::EventDispatch::Dispatcher.new }
  let(:run_context) { Chef::RunContext.new(node, {}, events) }
  let(:instance_name) { 'test_instance' }
  let(:config_res) do
    ChefInstance::Resource::Instance.new(
        instance_name, run_context)
  end

  before :each do
    @test_instance = ChefInstance::Provider::Instance.new(
        config_res, run_context)
  end

  describe 'Class type checks for ChefInstance::Provider::Instance' do
    it 'Is a ChefInstance::Resource::Instance' do
      @test_instance.must_be_kind_of(Chef::Provider)
    end
    it 'Subclasses Chef::Provider' do
      @test_instance.must_be_instance_of(ChefInstance::Provider::Instance)
    end
  end
end
