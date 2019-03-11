require 'rails_helper'

RSpec.describe "instruments/edit", type: :view do
  before(:each) do
    @instrument = assign(:instrument, Instrument.create!(
      :brand => "MyString",
      :model => "MyString",
      :description => "MyText",
      :condition => "MyString",
      :finish => "MyString",
      :title => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit instrument form" do
    render

    assert_select "form[action=?][method=?]", instrument_path(@instrument), "post" do

      assert_select "input[name=?]", "instrument[brand]"

      assert_select "input[name=?]", "instrument[model]"

      assert_select "textarea[name=?]", "instrument[description]"

      assert_select "input[name=?]", "instrument[condition]"

      assert_select "input[name=?]", "instrument[finish]"

      assert_select "input[name=?]", "instrument[title]"

      assert_select "input[name=?]", "instrument[price]"
    end
  end
end
