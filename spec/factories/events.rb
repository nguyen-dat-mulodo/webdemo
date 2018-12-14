FactoryGirl.define do
  factory :event do
    event_name "MyString"
    banner_event ""
    number_of_participants 1
    user nil
    start_at "2018-12-14 09:20:31"
    end_at "2018-12-14 09:20:31"
    location "MyString"
    price_ticket "MyText"
    description "MyText"
  end
end
