require 'spec_helper'

describe "room_categories/show" do
  before(:each) do
    @room_category = assign(:room_category, stub_model(RoomCategory,
      :name => "Name",
      :hotel => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
