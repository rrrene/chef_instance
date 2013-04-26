
require 'chef/provider'

class Chef
  class Provider
    class Instance < Chef::Provider

      def initialize(*args)
       super
      end

      def load_current_resource
        @current_resource = Chef::Resource::Instance.new(new_resource.name)

        @current_resource.created(created?)

        @current_resource
      end

      def action_create
      end

      def action_destroy
      end

      def action_disable
      end

      def action_enable
      end

      def action_restart
      end

      def action_start
      end

      def action_stop
      end

    end
  end
end

