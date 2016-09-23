# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket_file do
    file "MyString"
    description "MyString"
    ticket nil
    url "MyString"
  end
end
