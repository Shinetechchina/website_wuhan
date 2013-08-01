require 'spec_helper'

describe Refinery::Admin::DashboardController do
  routes { Refinery::Core::Engine.routes }
  include FirstUser

  describe ":refinery" do
    it "should access successful" do
      #get :index
      #response.should be_success
    end
  end

end
