class StoreController < ApplicationController
  include StoreIndexCount
  before_action :count
def index
    @products = Product.order(:title)
  end
end
