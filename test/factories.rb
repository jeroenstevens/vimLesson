FactoryGirl.define do

  factory :todo do
    sequence(:id) { |n| n }
    sequence(:title) { |n| "Object-#{n}" }
    created_at Time.now
    updated_at Time.now
  end

end
