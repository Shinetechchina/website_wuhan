
FactoryGirl.define do
  factory :client, :class => Refinery::Shinetech::Client do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

