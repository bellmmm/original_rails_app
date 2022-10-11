require 'test_helper'

class UsersRecommendProductsTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    log_in_as (@user)
    @product = products(:test01)
    @other_product = products(:test02)
    @third_product = products(:test03)
    @feature = features(:feat_1)
    # dislikeのfixtureで設定されているmichaelとtest01とのdislike関係を削除する
    dislike = @user.dislikes.find_by(product_id: @product.id)
    delete dislike_path(dislike)
  end

  test "should get user's dislike features" do
    assert_not @user.dislike_products.include?(@product)
    # dislikeに設定している要素が2つ未満の場合は表示しない
    post dislikes_path, params: { product_id: @product.id }
    get user_path(@user)
    assert_no_match CGI.escapeHTML(@feature.feature), response.body
    # dislikeに設定している要素が2つ以上のものを表示する
    post dislikes_path, params: { product_id: @other_product.id }
    get user_path(@user)
    assert_match CGI.escapeHTML(@feature.feature), response.body
  end

  test "should get user's recommended products" do
    # assert_not @user.dislike_products.include?(@product)
    # test01とtest02とのdislike関係を作成 
    post dislikes_path, params: { product_id: @product.id }
    post dislikes_path, params: { product_id: @other_product.id }
    all_body=""
    get user_path(@user)
    all_body+=response.body
    get user_path(@user),params:{page:2}
    all_body+=response.body
    get user_path(@user),params:{page:3}
    all_body+=response.body
    assert_no_match CGI.escapeHTML(@product.name), all_body
    assert_match CGI.escapeHTML(@third_product.name), all_body
  end

end
