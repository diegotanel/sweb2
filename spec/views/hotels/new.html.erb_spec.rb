require 'spec_helper'

describe "hotels/new" do
  before(:each) do
    assign(:hotel, stub_model(Hotel,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new hotel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hotels_path, "post" do
      assert_select "input#hotel_name[name=?]", "hotel[name]"
    end
  end
end
