# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket_type do
    sequence(:name) { |n| "Type #{n}" }
  end
end
