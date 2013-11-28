# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "Cool movie!"
    director "Alfred Hitchcocknballs"
    runtime_in_minutes 30
    description "It's really his coolest movie"
    poster_image_url "http://www.example.com/someimage.jpg"
    release_date 5.days.from_now
  end
end
