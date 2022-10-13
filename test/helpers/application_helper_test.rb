require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title(""), "PICK OUT"
    assert_equal full_title("Help"),  "Help | PICK OUT"
  end
end
