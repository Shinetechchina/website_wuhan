class HomeController < ApplicationController
  layout -> (controller) { controller.action_name == 'index' ? 'application' : false }

  def index
  end

  def home
  end

  def if_forefront
  end

  def services
  end

  def references
  end

  def frontiers
  end

  def blog
  end
end
