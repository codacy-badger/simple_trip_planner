FactoryBot.define do
  factory :trip do
    association :user, factory: :user
    title { 'My trip' }
    start_at { '2019-07-09 13:40:15' }
    end_at { '2019-07-10 13:40:15' }
    notes { 'My notes' }
  end
end
