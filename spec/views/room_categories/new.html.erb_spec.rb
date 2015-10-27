require 'spec_helper'

describe "room_categories/new" do
  before(:each) do
    assign(:room_category, stub_model(RoomCategory,
      :name => "MyString",
      :hotel => nil
    ).as_new_record)
  end

  it "renders new room_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", room_categories_path, "post" do
      assert_select "input#room_category_name[name=?]", "room_category[name]"
      assert_select "input#room_category_hotel[name=?]", "room_category[hotel]"
    end
  end
end
