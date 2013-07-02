module Refinery
  module Services
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Services

      engine_name :refinery_services

      initializer "register refinerycms_services plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "services"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.services_admin_services_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/services/service'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Services)
      end
    end
  end
end
