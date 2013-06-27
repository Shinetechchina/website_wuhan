class HomeController < ApplicationController
  layout -> (controller) { controller.action_name == 'index' ? 'application' : false }

  def index
  end
end
