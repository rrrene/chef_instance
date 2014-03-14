
require 'chef/provider'

class Chef
  class Provider
    class Instance < Chef::Provider

      def initialize(new_resource, run_context = nil)
        super
        @new_resource = new_resource
        @run_context = run_context
      end

      def whyrun_supported?
        false
      end

      def load_current_resource
        @current_resource = Chef::Resource::Instance.new(new_resource.name)
        @current_resource.created(created?)
        @current_resource
      end

      def action_create
        instance(@new_resource.install_type, 'install')
        instance(@new_resource.service_type, 'create')
      end

      def action_destroy
      end

      def action_disable
        instance(@new_resource.service_type, 'disable')
      end

      def action_enable
        instance(@new_resource.service_type, 'enable')
      end

      def action_restart
        instance(@new_resource.service_type, 'restart')
      end

      def action_start
        instance(@new_resource.service_type, 'start')
      end

      def action_stop
        instance(@new_resource.service_type, 'stop')
      end

      private

      def instance(type, action)
        instance_class = instance_sub_class(type)
        i = instance_class.new(@new_resource, @run_context)
        i.send(action)
      end

      def instance_sub_class(type)
        klass = "#{ instance_class }::#{ type.capitalize }"
        klass.split('::').reduce(Object) { |kls, t| kls.const_get(t) }
      end

      # FIXME: How can I make this smarter?
      # You should override this in your subclass
      def instance_class
        "Chef::Instance"
      end

    end
  end
end

