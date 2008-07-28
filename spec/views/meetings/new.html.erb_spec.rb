require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meetings/new.html.erb" do
  include MeetingsHelper
  
  before(:each) do
    assigns[:meeting] = stub_model(Meeting,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/meetings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", meetings_path) do
      with_tag("input#meeting_name[name=?]", "meeting[name]")
    end
  end
end


