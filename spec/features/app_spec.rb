require 'spec_helper'

describe "front-end pages", type: :feature do
  include FirstUser
  #include InitPages

  describe "Home page" do
    it 'have masthead mask' do
      visit '/'
      page.current_path.should eq '/'
      page.should have_selector('.masthead')
    end

    it 'have masthead mask', js: true do
      visit '/'
      page.current_path.should eq '/'
      page.should have_selector('.masthead')
    end
  end

  #TODO will add this test if init page successful
  #describe "redirct to pages via pushState" do
  #  it 'should access succeful', js: true do
  #    visit '/'
  #    page.current_path.should eq '/'
  #    page.evaluate_script "$(document).trigger('mousewheel');"
  #    #page.evaluate_script "alert('test');"
  #    sleep 1
  #    page.driver.render('tmp/capybara/home.png', :full => true)
  #    binding.pry

  #    within '#menu' do
  #      click_link('clients')
  #      page.current_path.should eq '/clients'

  #      click_link('TECHNOLOGIES')
  #      page.current_path.should eq '/technologies'

  #      click_link('SERVICES')
  #      page.current_path.should eq '/services'

  #      click_link('STAFFS')
  #      page.current_path.should eq '/staffs'

  #      click_link('BLOG')
  #      page.current_path.should eq '/blog'

  #      click_link('HOME')
  #      page.current_path.should eq '/'
  #    end
  #  end
  #end

end
