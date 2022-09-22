require 'test_helper'

class SetDislikeTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    log_in_as (@user)
    @test_product = products(:test01)
  end

  test "should set_dislike a test product" do
    assert_difference '@user.dislike_products.count', 1 do
      post dislikes_path, params: { product_id: @test_product.id }
    end
  end

  test "should set_dislike a test product with Ajax" do
    assert_difference '@user.dislike_products.count', 1 do
      post dislikes_path, xhr: true, params: {  product_id: @test_product.id }
    end
  end

  test "should unset_dislike a test product" do
    @user.set_dislike(@test_product)
    dislike = @user.dislikes.find_by(product_id: @test_product.id)
    assert_difference '@user.dislike_products.count', -1 do
      delete dislike_path(dislike)
    end
  end

  test "should unset_dislike a test product with Ajax" do
    @user.set_dislike(@test_product)
    dislike = @user.dislikes.find_by(product_id: @test_product.id)
    assert_difference '@user.dislike_products.count', -1 do
      delete dislike_path(dislike), xhr: true
    end
  end

end
