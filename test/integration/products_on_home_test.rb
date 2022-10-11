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

  # test "home for logged in users(index)" do
  #   log_in_as(@user)
  #   get root_path
  #   assert_template 'static_pages/home'
  #   # assert_select "div.products", count: 1
  #   first_page_of_products = Product.paginate(page: 1, per_page:12)
  #   first_page_of_products.each do |product|
  #     assert_select 'span.product-name', product.name
  #   end
  # end

test "home for logged in users" do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    # assert_select "div.products", count: 1
    test_products =  [
      Product.all[0],
      Product.all[1],
      Product.all[2],
      Product.all[5],
      Product.all[8],
      Product.all[9],
      Product.all[14],
      Product.all[15],
      Product.all[17],
      Product.all[19],
      Product.all[23],
      Product.all[24]
    ]
    test_products.each do |product|
      assert_select "div#test_product-#{product.id}"
    end
  end

  

  test "order of products should be ascending by id" do
    assert_equal Product.all.min, Product.first
  end

end
