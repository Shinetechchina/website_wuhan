# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :box do
    position 1
    boxable_id 1
    boxable_type "MyString"
    template "MyString"
  end
end
