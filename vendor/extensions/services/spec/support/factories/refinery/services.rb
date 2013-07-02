
FactoryGirl.define do
  factory :service, :class => Refinery::Services::Service do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

