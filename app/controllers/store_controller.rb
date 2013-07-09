class StoreController < ApplicationController
  include StoreIndexCount
  include CurrentCart
  before_action :set_cart
  before_action :count
  def index
    @products = Product.order(:title)
  end
end
