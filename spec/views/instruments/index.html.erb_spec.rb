require 'rails_helper'

RSpec.describe "instruments/index", type: :view do
  before(:each) do
    assign(:instruments, [
      Instrument.create!(
        :brand => "Brand",
        :model => "Model",
        :description => "MyText",
        :condition => "Condition",
        :finish => "Finish",
        :title => "Title",
        :price => "9.99"
      ),
      Instrument.create!(
        :brand => "Brand",
        :model => "Model",
        :description => "MyText",
        :condition => "Condition",
        :finish => "Finish",
        :title => "Title",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of instruments" do
    render
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
    assert_select "tr>td", :text => "Finish".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
