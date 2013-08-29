
FactoryGirl.define do
  factory :modal, :class => Refinery::Modals::Modal do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

