require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product = Product.new(product_URL: "https://test.com")
  end
  
  test "should be valid" do
    assert @product.valid?
  end

  test "product_URL should be present" do
    @product.product_URL = ""
    assert_not @product.valid?
  end

  test "product_URL should not be too long" do
    @product.product_URL = "a" * 254 + "test.com"
    assert_not @product.valid?
  end
end
