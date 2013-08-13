
FactoryGirl.define do
  factory :custom_box, :class => Refinery::CustomBoxes::CustomBox do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

