json.extract! event, :id, :event_name, :banner_event, :number_of_participants, :user_id, :start_at, :end_at, :location, :price_ticket, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
