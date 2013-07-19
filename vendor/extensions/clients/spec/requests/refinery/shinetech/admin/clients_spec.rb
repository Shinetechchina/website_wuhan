# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Shinetech" do
    describe "Admin" do
      describe "clients" do
        login_refinery_user

        describe "clients list" do
          before do
            FactoryGirl.create(:client, :name => "UniqueTitleOne")
            FactoryGirl.create(:client, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.shinetech_admin_clients_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.shinetech_admin_clients_path

            click_link "Add New Client"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Shinetech::Client.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Shinetech::Client.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:client, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.shinetech_admin_clients_path

              click_link "Add New Client"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Shinetech::Client.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:client, :name => "A name") }

          it "should succeed" do
            visit refinery.shinetech_admin_clients_path

            within ".actions" do
              click_link "Edit this client"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:client, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.shinetech_admin_clients_path

            click_link "Remove this client forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Shinetech::Client.count.should == 0
          end
        end

      end
    end
  end
end
