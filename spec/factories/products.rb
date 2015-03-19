FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "MyString#{n}" }
    sequence(:description) { |n| "MyText#{n}" }
    sequence(:image_url) { |n| "MyString#{n}" }
    sequence(:price) { |n| "#{n}.99" }
  end
end
