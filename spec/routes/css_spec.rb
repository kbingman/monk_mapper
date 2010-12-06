require 'spec_helper'

describe "routes/css" do
  
  def do_get
    get '/css/main.css'
  end

  it "should respond to /css/main.css" do
    do_get
    last_response.should be_ok
  end
  
  it "should have something like css" do
    do_get
    last_response.body.should include('body')
  end
  
  it "should correctly set the content type" do
    do_get
    last_response.headers['Content-Type'].should == 'text/css;charset=UTF-8'
  end
  
  # it "should correctly set the cache haeders" do
  #   do_get
  #   last_response.headers['Cache-Control'].should == 'max-age=600, public'
  # end
  
end