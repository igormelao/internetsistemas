FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "course_name_#{n}" }
    description 'Description'
    status 1
  end
end
