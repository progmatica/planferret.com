require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meetings/show.html.erb" do
  include MeetingsHelper
  
  before(:each) do
    assigns[:meeting] = @meeting = stub_model(Meeting,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/meetings/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

