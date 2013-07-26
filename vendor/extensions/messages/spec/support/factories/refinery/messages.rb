
FactoryGirl.define do
  factory :message, :class => Refinery::Messages::Message do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

