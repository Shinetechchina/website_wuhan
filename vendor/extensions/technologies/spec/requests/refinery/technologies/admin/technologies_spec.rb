# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Technologies" do
    describe "Admin" do
      describe "technologies" do
        login_refinery_user

        describe "technologies list" do
          before do
            FactoryGirl.create(:technology, :title => "UniqueTitleOne")
            FactoryGirl.create(:technology, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.technologies_admin_technologies_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.technologies_admin_technologies_path

            click_link "Add New Technology"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Technologies::Technology.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Technologies::Technology.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:technology, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.technologies_admin_technologies_path

              click_link "Add New Technology"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Technologies::Technology.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:technology, :title => "A title") }

          it "should succeed" do
            visit refinery.technologies_admin_technologies_path

            within ".actions" do
              click_link "Edit this technology"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:technology, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.technologies_admin_technologies_path

            click_link "Remove this technology forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Technologies::Technology.count.should == 0
          end
        end

      end
    end
  end
end
