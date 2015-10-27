require 'spec_helper'

describe "room_categories/edit" do
  before(:each) do
    @room_category = assign(:room_category, stub_model(RoomCategory,
      :name => "MyString",
      :hotel => nil
    ))
  end

  it "renders the edit room_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", room_category_path(@room_category), "post" do
      assert_select "input#room_category_name[name=?]", "room_category[name]"
      assert_select "input#room_category_hotel[name=?]", "room_category[hotel]"
    end
  end
end
