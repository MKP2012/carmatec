FactoryGirl.define do
  factory :contact do
    name     { Faker::Name.name }
    email         { Faker::Internet.email }
  end
  factory :contact_list do
    name {Faker::Name.name}
  end	
end
