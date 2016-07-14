FactoryGirl.define do
  factory :classroom do
    student
    course
    entry_at DateTime.now
  end

  trait :invalid_classroom do
    entry_at nil
  end
end
