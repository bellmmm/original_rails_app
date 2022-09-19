require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
   @product = products(:test01)
  end

  
  test "should get show" do
    get product_path(@product)
    assert_response :success
  end

end
