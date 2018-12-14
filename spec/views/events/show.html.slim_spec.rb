require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :event_name => "Event Name",
      :banner_event => "",
      :number_of_participants => 2,
      :user => nil,
      :location => "Location",
      :price_ticket => "MyText",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Event Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
