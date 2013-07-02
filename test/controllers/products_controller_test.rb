require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include ActionView::Helpers::SanitizeHelper
  setup do
    @product = products(:one)
    @update = {
      title: 'Lorem Ipsum',
      description: 'Wibblesare fun!',
      image_url: 'lorem.jpg',
      price: 1995
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .list_description', 3
    assert_select 'dt', 'Programming Ruby 1.9'
    assert_select "form", false, "This page must contain no forms"
    assert_not_nil assigns(:products)
  end

  test "product description should be 80 characters or less" do
    get :index
    descriptions = css_select("dd")
    descriptions.map { |x| strip_tags(x.to_s) }.each do |desc|
      assert desc.length <= 80, "Product description '#{desc}' has #{desc.length} characters, should be 80 or less"
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
