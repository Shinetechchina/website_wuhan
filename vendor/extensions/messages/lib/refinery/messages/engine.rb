module Refinery
  module Messages
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Messages

      engine_name :refinery_messages

      initializer "register refinerycms_messages plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "messages"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.messages_admin_messages_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/messages/message',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Messages)
      end
    end
  end
end
