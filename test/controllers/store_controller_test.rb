require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test "test index counter" do
    assert session[:count].nil?
    get :index
    refute session[:count].nil?
    assert session[:count] == 1
    get :index
    assert session[:count] == 2
    assert_difference('session[:count]', 2) do
      get :index
      get :index
    end
  end

  test "markup needed for store.js.coffee is in place" do
    get :index
    assert_select '.store .entry > img', 3
    assert_select '.entry input[type=submit]', 3
  end
end
