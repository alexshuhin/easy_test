FactoryGirl.define do
  factory :comment do
    body { FFaker::Lorem.sentence(rand(1..5)) }
    association :author, factory: :user
    association :post, factory: :post
  end
end
