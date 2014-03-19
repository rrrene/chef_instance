require 'chef/provider'

module ChefInstance
  # Provides actions for the Instance resource.
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
    end

    def action_create
      instance(@new_resource.install_type, :install)
      instance(@new_resource.service_type, :create)
    end

    def action_destroy
    end

    def action_disable
      instance(@new_resource.service_type, :disable)
    end

    def action_enable
      instance(@new_resource.service_type, :enable)
    end

    private

    def instance(type, action)
      instance_class = instance_sub_class(type)
      i = instance_class.new(@new_resource, @run_context)
      i.send(action)
    end

    def instance_sub_class(type)
      klass = "#{ self.class }::#{ type.capitalize }"
      klass.split('::').reduce(Object) { |a, e| a.const_get(e) }
    end
  end
end
