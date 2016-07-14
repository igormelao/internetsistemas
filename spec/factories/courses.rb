FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "course_name_#{n}" }
    description 'Description'
    status :active
  end

  trait :course_invalid do
    name nil
  end
end
