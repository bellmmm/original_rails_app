require 'test_helper'

class DislikeTest < ActiveSupport::TestCase
  def setup 
    @dislike = Dislike.new(user_id: users(:michael).id, product_id: products(:test01).id )
  end

  test "should be valid" do
    assert @dislike.valid?
  end

  test "should require a user id" do
    @dislike.user_id = nil
    assert_not @dislike.valid?
  end

  test "should require a product id" do
    @dislike.product_id = nil
    assert_not @dislike.valid?
  end

end
