require 'test_helper'

class ElementsTest < ActionDispatch::IntegrationTest
  
  def setup
    @product = products(:test01)

  end

  test "elements on a product page" do
    get product_path(@product)
    @product.elements.each do |element|
      assert_match CGI.escapeHTML(element.feature), response.body
    end
  end
end
