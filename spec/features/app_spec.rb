require 'spec_helper'

describe "Home page", type: :feature do
  before :each do
    visit '/'
  end

  it 'inital into' do
    page.has_css?('.masthead').should be_true
  end
end
