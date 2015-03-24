FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description {
      description = <<-DESCRIPTION
        These #{Faker::Commerce.color} #{name.pluralize}
        will help you generate
        #{Faker::Company.catch_phrase} with
        #{Faker::Company.bs}
      DESCRIPTION
      description.gsub!(/[\n\s]+/, ' ')
      description
    }
    image_url { "/images/#{rand(10_000)}.png" }
    price { sprintf("%.02f", rand * 999) }
  end
  # factory :product do
  #   sequence(:name) { |n| "MyString#{n}" }
  #   sequence(:description) { |n| "MyText#{n}" }
  #   sequence(:image_url) { |n| "MyString#{n}" }
  #   sequence(:price) { |n| "#{n}.99" }
  # end
end
