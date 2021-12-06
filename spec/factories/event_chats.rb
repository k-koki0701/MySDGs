FactoryBot.define do
  factory :event_chat do
    content { "MyText" }
    user { nil }
    event { nil }
  end
end
