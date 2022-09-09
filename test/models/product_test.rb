require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product = Product.new(product_name: "testname")
  end
  
  test "should be valid" do
    assert @product.valid?
  end

  test "product_name should be present" do
    @product.product_name = ""
    assert_not @product.valid?
  end

  test "product_name should not be too long" do
    @product.product_name = "a" * 254 + "testname"
    assert_not @product.valid?
  end

  test "product_name should be unique" do
    duplicate_product = @product.dup
    @product.save
    assert_not duplicate_product.valid?
  end
end
