require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :event_name => "Event Name",
        :banner_event => "",
        :number_of_participants => 2,
        :user => nil,
        :location => "Location",
        :price_ticket => "MyText",
        :description => "MyText"
      ),
      Event.create!(
        :event_name => "Event Name",
        :banner_event => "",
        :number_of_participants => 2,
        :user => nil,
        :location => "Location",
        :price_ticket => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Event Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
