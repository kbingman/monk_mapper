require File.dirname(__FILE__) + '/acceptance_helper'

feature "Signup" do

  context 'Anonymous user' do
    
    before(:all) do
    end
    
    before(:each) do
      
    end
  
    scenario "A user views the home page" do
      visit '/'
      page.should have_content('Hello, world!')
    end
    
  end
end