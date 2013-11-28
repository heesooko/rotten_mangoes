# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    text "This is my review"
    rating_out_of_ten 4
    user
    movie
  end
end
