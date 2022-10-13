require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "PICK OUT"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "PICK OUT"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | PICK OUT"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | PICK OUT"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | PICK OUT"
  end
end
