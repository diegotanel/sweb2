require 'spec_helper'

describe "hotels/edit" do
  before(:each) do
    @hotel = assign(:hotel, stub_model(Hotel,
      :name => "MyString"
    ))
  end

  it "renders the edit hotel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hotel_path(@hotel), "post" do
      assert_select "input#hotel_name[name=?]", "hotel[name]"
    end
  end
end
