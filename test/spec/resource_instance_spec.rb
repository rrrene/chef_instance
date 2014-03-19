# minitest spec for ChefInstance::Resource::Instance
# Uses expectations from:
# http://docs.seattlerb.org/minitest/Minitest/Expectations.html

require_relative 'spec_helper'
require 'resource_instance'
require 'provider_instance'

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

  before :each do
    @test_instance = ChefInstance::Resource::Instance.new(
        instance_name, run_context)
  end

  describe 'Parameter tests for Chef::Resource::Instance' do
    it "has a 'install_type' parameter that can be set" do
      @test_instance.must_respond_to(:install_type)
      @test_instance.install_type(:package)
      @test_instance.install_type.must_equal(:package)
    end

    it "has a 'install_options' parameter that can be set" do
      test_config = {
        format: 'plain',
        path: %w(/var/log/httpd/*_log),
        type: 'httpd'
      }

      @test_instance.must_respond_to :install_options
      @test_instance.install_options(test_config)
      @test_instance.install_options.must_equal(test_config)
    end
  end
end
