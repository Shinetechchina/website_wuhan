module Refinery
  module Customs
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Customs

      engine_name :refinery_customs

      initializer "register refinerycms_customs plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "customs"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.customs_admin_customs_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/customs/custom'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Customs)
      end
    end
  end
end
