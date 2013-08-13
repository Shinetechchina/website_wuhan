# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CustomBoxes" do
    describe "Admin" do
      describe "custom_boxes" do
        login_refinery_user

        describe "custom_boxes list" do
          before do
            FactoryGirl.create(:custom_box, :title => "UniqueTitleOne")
            FactoryGirl.create(:custom_box, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.custom_boxes_admin_custom_boxes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.custom_boxes_admin_custom_boxes_path

            click_link "Add New Custom Box"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::CustomBoxes::CustomBox.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::CustomBoxes::CustomBox.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:custom_box, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.custom_boxes_admin_custom_boxes_path

              click_link "Add New Custom Box"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::CustomBoxes::CustomBox.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:custom_box, :title => "A title") }

          it "should succeed" do
            visit refinery.custom_boxes_admin_custom_boxes_path

            within ".actions" do
              click_link "Edit this custom box"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:custom_box, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.custom_boxes_admin_custom_boxes_path

            click_link "Remove this custom box forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::CustomBoxes::CustomBox.count.should == 0
          end
        end

      end
    end
  end
end
