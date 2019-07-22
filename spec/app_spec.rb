require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

RSpec.describe "Default Sinatra" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should return 200" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to match(/Default Sinatra/)
  end

  it "should return 404" do
    get '/404'
    expect(last_response.status).to eq(404)
  end
end

RSpec.describe "Visit Default Sinatra" do
  it 'visits the homepage' do
    visit '/'
    expect(page.html).to match(/Default Sinatra/)
  end
end