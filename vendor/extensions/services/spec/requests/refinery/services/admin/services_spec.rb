# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Services" do
    describe "Admin" do
      describe "services" do
        login_refinery_user

        describe "services list" do
          before do
            FactoryGirl.create(:service, :title => "UniqueTitleOne")
            FactoryGirl.create(:service, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.services_admin_services_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.services_admin_services_path

            click_link "Add New Service"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Services::Service.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Services::Service.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:service, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.services_admin_services_path

              click_link "Add New Service"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Services::Service.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:service, :title => "A title") }

          it "should succeed" do
            visit refinery.services_admin_services_path

            within ".actions" do
              click_link "Edit this service"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:service, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.services_admin_services_path

            click_link "Remove this service forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Services::Service.count.should == 0
          end
        end

      end
    end
  end
end
