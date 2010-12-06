require 'spec_helper'

describe "routes/site" do
    
  context 'not logged in' do
    
    it 'should be successful' do
      get '/'
      last_response.should be_ok
    end
    
    it 'should show some text' do
      get '/'
      last_response.body.should include('Hello, world!')
    end
    
  end
end