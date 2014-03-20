require 'chef/resource'

module ChefInstance
  module Resource
    # Docs
    class Instance < Chef::Resource
      def initialize(new_resource, run_context = nil)
        super
        @provider = ChefInstance::Provider::Instance
        @action = :create
        @allowed_actions = [:create, :destroy, :enable, :disable, :nothing]
      end

      def install_options(arg = nil)
        set_or_return(:install_options, arg, kind_of: Hash)
      end

      def install_type(arg = nil)
        set_or_return(:install_type,
                      arg,
                      kind_of: [Symbol],
                      required: true,
                      equal_to: [:package])
      end

      def service_options(arg = nil)
        set_or_return(:service_options, arg, kind_of: Hash)
      end

      def service_type(arg = nil)
        set_or_return(:service_type,
                      arg,
                      kind_of: Symbol,
                      required: true,
                      equal_to: [:runit])
      end
    end
  end
end
