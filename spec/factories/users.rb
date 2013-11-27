# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    firstname "Some"
    lastname "Body"
    sequence(:email) {|i| "person-#{i}@gmail.com"  }
    password "gobbledigook"
    password_confirmation "gobbledigook"
  end
end
