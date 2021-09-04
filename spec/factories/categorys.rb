FactoryBot.define do
  factory :category do
    sequence(:name) { |n| n.to_s }
  end
  factory :category2, class: 'Category' do
    name { '陸の豊かさを守ろう' }
  end
end
