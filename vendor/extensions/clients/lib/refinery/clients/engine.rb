module Refinery
  module Shinetech
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Shinetech

      engine_name :refinery_clients

      initializer "register refinerycms_clients plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "clients"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.shinetech_admin_clients_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/shinetech/client',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/shinetech/clients(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Clients)
      end
    end
  end
end
