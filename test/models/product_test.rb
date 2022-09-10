require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product = Product.new(name: "testname")
  end
  
  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = ""
    assert_not @product.valid?
  end

  test "name should not be too long" do
    @product.name = "a" * 254 + "testname"
    assert_not @product.valid?
  end

  test "name should be unique" do
    duplicate_product = @product.dup
    @product.save
    assert_not duplicate_product.valid?
  end
end
