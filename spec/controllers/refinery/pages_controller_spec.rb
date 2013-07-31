require 'spec_helper'

describe Refinery::PagesController do
  routes { Refinery::Core::Engine.routes }
  include FirstUser

  describe ":home" do
    it "should access successful" do
      get :home
      response.should be_success
    end
  end

  describe ":blog" do
    #it "should access successful" do
    #  get :blog
    #  response.should be_success
    #end
  end
end
