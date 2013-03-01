require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Default Sinatra' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should return 302" do
    get '/'
    last_response.status.should == 302
  end

  it "should return 404" do
    get '/404'
    last_response.status.should == 404
  end
end
