module Refinery
  module Customers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Customers

      engine_name :refinery_customers

      initializer "register refinerycms_customers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "customers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.customers_admin_customers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/customers/customer',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Customers)
      end
    end
  end
end
