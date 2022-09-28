require 'test_helper'

class FeatureTest < ActiveSupport::TestCase
  def setup
    @feature = features(:feat_1)
  end

  test "should be valid" do
    assert @feature.valid?
  end

  test "features should be present" do
    @feature.feature = ""
    assert_not @feature.valid?
  end

  test "features should be unique" do
    duplicate_feature = @feature.dup
    @feature.save
    assert_not duplicate_feature.valid?
  end
end
