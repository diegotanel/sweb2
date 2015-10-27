require 'spec_helper'

describe "hotels/show" do
  before(:each) do
    @hotel = assign(:hotel, stub_model(Hotel,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
