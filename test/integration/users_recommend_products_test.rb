require 'test_helper'

class UsersRecommendProductsTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    log_in_as (@user)
    @product = products(:test01)
    @other_product = products(:test02)
    @third_product = products(:test03)
    @feature = features(:feat_1)
    # dislikeのfixtureで設定されているtest01とのdislike関係を削除する
    dislike = @user.dislikes.find_by(product_id: @product.id)
    delete dislike_path(dislike)
    assert_not @user.dislike_products.include?(@product)
  end

  test "should get features which users don't choose as dislike features (twice)" do
    # dislikeに設定している要素が2つ未満の場合は表示しない
    post dislikes_path, params: { product_id: @product.id }
    get user_path(@user)
    assert_no_match CGI.escapeHTML(@feature.feature), response.body
    # dislikeに設定している要素が2つ以上のものを表示する
    post dislikes_path, params: { product_id: @other_product.id }
    get user_path(@user)
    assert_match CGI.escapeHTML(@feature.feature), response.body
  end

  test "should get users recommended products" do
    # test01とtest02とのdislike関係を作成 
    post dislikes_path, params: { product_id: @product.id }
    post dislikes_path, params: { product_id: @other_product.id }
    get user_path(@user)
    assert_no_match CGI.escapeHTML(@product.name), response.body
    assert_match CGI.escapeHTML(@third_product.name), response.body
  end

end
