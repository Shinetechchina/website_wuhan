# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Customs" do
    describe "Admin" do
      describe "customs" do
        login_refinery_user

        describe "customs list" do
          before do
            FactoryGirl.create(:custom, :title => "UniqueTitleOne")
            FactoryGirl.create(:custom, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.customs_admin_customs_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.customs_admin_customs_path

            click_link "Add New Custom"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Customs::Custom.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Customs::Custom.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:custom, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.customs_admin_customs_path

              click_link "Add New Custom"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Customs::Custom.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:custom, :title => "A title") }

          it "should succeed" do
            visit refinery.customs_admin_customs_path

            within ".actions" do
              click_link "Edit this custom"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:custom, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.customs_admin_customs_path

            click_link "Remove this custom forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Customs::Custom.count.should == 0
          end
        end

      end
    end
  end
end
