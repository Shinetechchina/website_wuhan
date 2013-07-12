
FactoryGirl.define do
  factory :technology, :class => Refinery::Technologies::Technology do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

