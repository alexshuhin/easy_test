FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::NameRU.name }
    password { SecureRandom.base64(8) }
  end
end
