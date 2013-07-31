require 'spec_helper'

describe "Home page", type: :feature do
  include FirstUser

  it 'have masthead mask' do
    visit '/'
    page.current_path.should eq '/'
    page.should have_selector('.masthead')
  end

  it 'have masthead mask', js: true do
    visit '/'
    page.current_path.should eq '/'
    page.should have_selector('.masthead', style: 'display: block;')
    page.evaluate_script 'window.scrollTo(0,100)'
    page.should have_selector('.masthead', style: 'display: none;')
  end

end
