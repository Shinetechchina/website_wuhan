module Refinery
  module CustomBoxes
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::CustomBoxes

      engine_name :refinery_custom_boxes

      initializer "register refinerycms_custom_boxes plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "custom_boxes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.custom_boxes_admin_custom_boxes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/custom_boxes/custom_box'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CustomBoxes)
      end
    end
  end
end
