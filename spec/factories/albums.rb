FactoryBot.define do
  factory :album do
    title       {'a'}
    category_id {'2'}
    association :user
  end
end