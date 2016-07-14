FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "student_name_#{n}" }
    sequence(:register_number) { |n| "register_#{n}" }
    status :active
  end

  trait :invalid do
    name nil
  end
end
