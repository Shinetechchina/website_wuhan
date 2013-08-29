# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Modals" do
    describe "Admin" do
      describe "modals" do
        login_refinery_user

        describe "modals list" do
          before do
            FactoryGirl.create(:modal, :title => "UniqueTitleOne")
            FactoryGirl.create(:modal, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.modals_admin_modals_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.modals_admin_modals_path

            click_link "Add New Modal"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Modals::Modal.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Modals::Modal.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:modal, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.modals_admin_modals_path

              click_link "Add New Modal"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Modals::Modal.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:modal, :title => "A title") }

          it "should succeed" do
            visit refinery.modals_admin_modals_path

            within ".actions" do
              click_link "Edit this modal"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:modal, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.modals_admin_modals_path

            click_link "Remove this modal forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Modals::Modal.count.should == 0
          end
        end

      end
    end
  end
end
