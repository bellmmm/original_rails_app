require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product = products(:test01)
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

  
  test "should set and unset composed" do
    product = products(:test01)
    feature = features(:feat_1)
    assert_not product.setting_composed?(feature)
    product.set_composed(feature)
    assert product.setting_composed?(feature)
    product.unset_composed(feature)
    assert_not product.setting_composed?(feature)
  end
end
