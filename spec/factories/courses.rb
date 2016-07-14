FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "course_name_#{n}" }
    description 'Description'
    status Status::ACTIVE
  end

  trait :course_invalid do
    name nil
  end
end
