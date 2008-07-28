require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meetings/edit.html.erb" do
  include MeetingsHelper
  
  before(:each) do
    assigns[:meeting] = @meeting = stub_model(Meeting,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/meetings/edit.html.erb"
    
    response.should have_tag("form[action=#{meeting_path(@meeting)}][method=post]") do
      with_tag('input#meeting_name[name=?]', "meeting[name]")
    end
  end
end


