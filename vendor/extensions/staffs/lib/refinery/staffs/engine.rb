module Refinery
  module Staffs
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Staffs

      engine_name :refinery_staffs

      initializer "register refinerycms_staffs plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "staffs"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.staffs_admin_staffs_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/staffs/staff',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Staffs)
      end
    end
  end
end
