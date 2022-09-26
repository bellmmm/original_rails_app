require 'test_helper'

class DislikesControllerTest < ActionDispatch::IntegrationTest
  
  test "create should require logged-in user" do
    assert_no_difference 'Dislike.count' do
      post dislikes_path
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Dislike.count' do
      delete dislike_path(dislikes(:one))
    end
    assert_redirected_to login_url
  end
end
