
require 'chef/resource'

class Chef
  class Resource
    class Instance < Chef::Resource

      def initialize(name, run_context=nil)
        super
        @provider = Chef::Provider::Instance
        @action = :create
        @allowed_actions = [:create, :destroy, :enable, :disable, :nothing, :start, :stop, :restart]
        @created   = false
        @destroyed = false
        @disabled  = false
        @enabled   = false
        @started   = false
        @stopped   = false
      end

      def created(arg=nil)
        set_or_return(:created, arg, :kind_of => [TrueClass, FalseClass])
      end

      def destroyed(arg=nil)
        set_or_return(:destroyed, arg, :kind_of => [TrueClass, FalseClass])
      end

      def disabled(arg=nil)
        set_or_return(:disabled, arg, :kind_of => [TrueClass, FalseClass])
      end

      def enabled(arg=nil)
        set_or_return(:enabled, arg, :kind_of => [TrueClass, FalseClass])
      end

      def started(arg=nil)
        set_or_return(:started, arg, :kind_of => [TrueClass, FalseClass])
      end

      def stopped(arg=nil)
        set_or_return(:stopped, arg, :kind_of => [TrueClass, FalseClass])
      end

    end
  end
end


