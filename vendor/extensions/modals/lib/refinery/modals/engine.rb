module Refinery
  module Modals
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Modals

      engine_name :refinery_modals

      initializer "register refinerycms_modals plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "modals"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.modals_admin_modals_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/modals/modal'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Modals)
      end
    end
  end
end
