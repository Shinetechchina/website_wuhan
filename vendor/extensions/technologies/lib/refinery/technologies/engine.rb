module Refinery
  module Technologies
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Technologies

      engine_name :refinery_technologies

      initializer "register refinerycms_technologies plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "technologies"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.technologies_admin_technologies_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/technologies/technology'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Technologies)
      end
    end
  end
end
