require 'test_helper'

class ProductsOnHomeTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @product = products(:test01)
  end

  test "home for gest users" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "div.products", count: 0
  end

  test "home for logged in users" do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    # assert_select "div.products", count: 1
    first_page_of_products = Product.paginate(page: 1, per_page:12)
    first_page_of_products.each do |product|
      assert_select 'span.product-name', product.name
    end
  end

  test "order of products should be ascending by id" do
    assert_equal products(:test01), Product.first
  end

end
