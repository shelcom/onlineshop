require 'rails_helper'

RSpec.describe "instruments/show", type: :view do
  before(:each) do
    @instrument = assign(:instrument, Instrument.create!(
      :brand => "Brand",
      :model => "Model",
      :description => "MyText",
      :condition => "Condition",
      :finish => "Finish",
      :title => "Title",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Condition/)
    expect(rendered).to match(/Finish/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/9.99/)
  end
end
