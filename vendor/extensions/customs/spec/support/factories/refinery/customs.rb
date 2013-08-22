
FactoryGirl.define do
  factory :custom, :class => Refinery::Customs::Custom do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

