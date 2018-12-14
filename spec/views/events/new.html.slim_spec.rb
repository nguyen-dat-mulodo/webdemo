require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :event_name => "MyString",
      :banner_event => "",
      :number_of_participants => 1,
      :user => nil,
      :location => "MyString",
      :price_ticket => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_event_name[name=?]", "event[event_name]"

      assert_select "input#event_banner_event[name=?]", "event[banner_event]"

      assert_select "input#event_number_of_participants[name=?]", "event[number_of_participants]"

      assert_select "input#event_user_id[name=?]", "event[user_id]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "textarea#event_price_ticket[name=?]", "event[price_ticket]"

      assert_select "textarea#event_description[name=?]", "event[description]"
    end
  end
end
