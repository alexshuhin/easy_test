FactoryGirl.define do
  factory :post do
    title { FFaker::Lorem.words(rand(1..5)).join(' ') }
    body { FFaker::Lorem.paragraphs(rand(1..5)).join("\n") }
    tag_list { (1..5).map{ FFaker::Lorem.word } }
    association :author, factory: :user

    published true
    published_at { DateTime.now }
  end
end
