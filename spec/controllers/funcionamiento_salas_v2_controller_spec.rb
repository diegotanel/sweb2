require 'spec_helper'

describe FuncionamientoSalasV2Controller do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
