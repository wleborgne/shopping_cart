require 'rails_helper'

describe LineItemsController do
  let(:cart) { FactoryGirl.create(:cart) }
  let(:product) { FactoryGirl.create(:product) }
  let(:valid_attributes) { { product_id: product.id } }
  let(:valid_session) { {cart_id: cart.id} }

  describe "POST create" do
    describe "with valid params" do
      it "adds the LineItem to the cart" do
        expect {
          post :create, valid_attributes, valid_session
        }.to change(cart.line_items, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, valid_attributes, valid_session
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to include('Product added to cart')
      end
    end

    describe "with invalid params" do
      it "raises an error" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(LineItem).to receive(:save).and_return(false)
        expect {
          post :create, {:product_id => 123456789 }, valid_session
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end

