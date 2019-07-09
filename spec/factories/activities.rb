FactoryBot.define do
  factory :activity do
    association :trip, factory: :trip
    description { 'My activity' }
    start_at { '2019-07-09 16:09:51' }
    end_at { '2019-07-09 16:09:51' }
    notes { 'My notes' }
    price { '9.99' }
  end
end
