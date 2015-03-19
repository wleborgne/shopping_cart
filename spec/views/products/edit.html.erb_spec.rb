require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :description => "MyText",
      :image_url => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "textarea#product_description[name=?]", "product[description]"

      assert_select "input#product_image_url[name=?]", "product[image_url]"

      assert_select "input#product_price[name=?]", "product[price]"
    end
  end
end
