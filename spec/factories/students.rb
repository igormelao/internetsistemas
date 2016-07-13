FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "student_name_#{n}" }
    sequence(:register_number) { |n| "register_#{n}" }
    status 1
  end
end
