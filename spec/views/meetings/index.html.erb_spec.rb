require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meetings/index.html.erb" do
  include MeetingsHelper
  
  before(:each) do
    assigns[:meetings] = [
      stub_model(Meeting,
        :name => "value for name"
      ),
      stub_model(Meeting,
        :name => "value for name"
      )
    ]
  end

  it "should render list of meetings" do
    render "/meetings/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

