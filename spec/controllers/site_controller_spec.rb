require 'spec_helper'

describe SiteController do
  describe ":home" do
    it "should access successful" do
      get :home, {use_route: :sites}
      response.should be_success
    end
  end
end
