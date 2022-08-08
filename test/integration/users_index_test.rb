require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:michael)
    @non_admin = users(:archer)
    @unactivated = users(:unactivated_michael)
  end
  
  test "index as admin including pagination and delete links without unactivated users" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    # User.paginate(page:1).each do |user|
      # assert_select 'a[href=?]', user_path(user), text:user.name
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      if user = @unactivated
        assert_select 'a[href=?]', user_path(user), text:user.name, count:0
      else
        assert_select 'a[href=?]', user_path(user), text:user.name
        unless user == @admin
          assert_select 'a[href=?]', user_path(user), test: 'delete'
        end
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text:'delete', count: 0
  end

  test "show for unactivated users" do
    log_in_as(@non_admin)
    get user_path(@unactivated)
    assert_redirected_to root_url
  end

  


end
