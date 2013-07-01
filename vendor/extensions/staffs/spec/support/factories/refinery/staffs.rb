
FactoryGirl.define do
  factory :staff, :class => Refinery::Staffs::Staff do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

