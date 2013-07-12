
FactoryGirl.define do
  factory :customer, :class => Refinery::Customers::Customer do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

