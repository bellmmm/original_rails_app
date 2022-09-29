require 'test_helper'

class ComposedTest < ActiveSupport::TestCase
  
  def setup
    @composed = Composed.new(product_id: products(:test01).id, feature_id: features(:feat_1).id)
  end

  test "should be valid" do
    assert @composed.valid?
  end

  test "shoud require a product id" do
    @composed.product_id = nil
    assert_not @composed.valid?
  end

  test "should require a feature id" do
    @composed.feature_id = nil
    assert_not @composed.valid?
  end

end
