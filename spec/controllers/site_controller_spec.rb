require 'spec_helper'

describe SiteController do
  let(:refinery_role) {create :refinery_role}
  let(:superuser) {create :refinery_role, title: 'Superuser'}
  let(:refinery_user) {create :refinery_user}
  before(:each){ refinery_user.roles= [refinery_role, superuser] }

  describe ":home" do
    it "should access successful" do
      get :home, {use_route: :sites}
      response.should be_success
    end
  end
end
